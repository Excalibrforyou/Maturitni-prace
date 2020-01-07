<?php
class SpravceUzivatelu {
  public function pripravPrazdnePoleUzivatele() {
    return array(
      "ID_uzivatele" => "",
      "jmeno" => "",
      "prijmeni" => "",
      "prezdivka" => "",
      "email" => "",
      "heslo" => "",
      "over_kod" => ""
    );
  }

  public function vratVsechnyUzivatele() {
    $uzivatele = Db::dotazVsechny("
      SELECT *
      FROM uzivatel
      ORDER BY prezdivka
    ");
    return $uzivatele;
  }
  
  public function vratUzivatele($idUzivatele) {
    return Db::dotazJeden("
      SELECT *
      FROM uzivatel
      WHERE ID_uzivatele = ?
    ", array($idUzivatele));
  }
  
  public function ulozUzivatele($udajeUzivatele,$kod) {
    $klice = array(
      "ID_uzivatele","jmeno", "prijmeni", "prezdivka", "email", "heslo"
    ); 
    
    
    $udajeUzivateleDB = array_intersect_key($udajeUzivatele, array_flip($klice));
    $udajeUzivateleDB["over_kod"] = $kod; 
    $hashHesla = $this->vratHashHesla($udajeUzivatele["heslo"]);
    if (empty($udajeUzivatele["ID_uzivatele"]))
    {
      $udajeUzivateleDB["heslo"] = $hashHesla;
      Db::vloz("uzivatel", $udajeUzivateleDB);
    }
    else
    { 
      if ($udajeUzivatele["heslo"] != "") 
        $udajeUzivateleDB["heslo"] = $hashHesla;
      Db::zmen("uzivatel", $udajeUzivateleDB, 
               "WHERE ID_uzivatele = ?", array($udajeUzivatele["ID_uzivatele"])); 
    }           
  }
  
  public function odstranUzivatele($idUzivatele) {
    Db::dotaz("
      DELETE FROM uzivatel
      WHERE ID_uzivatele = ?
    ", array($idUzivatele));
  }
  
  private function vratHashHesla($heslo) {
    return hash("sha256", $heslo);
  }
  
  public function prihlas($login, $heslo) {
    $uzivatel = Db::dotazJeden("
      SELECT *
      FROM uzivatel
      WHERE prezdivka = ?
    ", array($login));
    
    if(!$uzivatel){ 
      return false;
       }   
    if ($uzivatel["heslo"] == $this->vratHashHesla($heslo))
    {    
      $_SESSION["uzivatel"] = $uzivatel;
      return $uzivatel;
    }  
  }
  
  public function odhlas() {
    unset($_SESSION["uzivatel"]);
  }
  
  // vrátí údaje aktuálně přihlášeného uživatele nebo false (není-li nikdo přihlášen)
  public function vratUdajePrihlasenehoUzivatele() {
    if (isset($_SESSION["uzivatel"]))
      return $_SESSION["uzivatel"];
    else
      return false;  
  } 

  // vygeneruje kod o velikosti 40 znaku
  public function vygenerujNahodnyKod() { 

    $znaky = "abcdefghijkmnopqrstuvwxyz023456789"; 
    srand((double)microtime()*1000000); 
    $i = 0; 
    $kod = '' ; 

    while ($i <= 40) { 
        $num = rand() % 33; 
        $j = substr($znaky, $num, 1); 
        $kod = $kod . $j; 
        $i++; 
    } 

    return $kod; 

} 
}
?>