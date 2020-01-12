<?php
class SpravceUzivatelu {
  public function pripravPrazdnePoleUzivatele() {
    return array(
      "ID_uzivatele" => "",
      "jmeno" => "",
      "prijmeni" => "",
      "prezdivka" => "",
      "email" => "",
      "heslo" => ""
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
  
  
  public function ulozUzivatele($udajeUzivatele) {
    $klice = array(
      "ID_uzivatele","jmeno", "prijmeni", "prezdivka", "email", "heslo"
    ); 
    
    
    $udajeUzivateleDB = array_intersect_key($udajeUzivatele, array_flip($klice));
   

    $hashHesla = $this->vratHashHesla($udajeUzivatele["heslo"]);
    if (empty($udajeUzivatele["ID_uzivatele"]))
    {
      $udajeUzivateleDB["heslo"] = $hashHesla;  
      $udajeUzivateleDB["over_kod"] = $this::vygenerujNahodnyKod(); 
      $udajeUzivateleDB["typ_uctu"] = 1;
      if($this::neopakujSe($udajeUzivatele))  
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
  
  //odstraní uživatele
  
  public function odstranUzivatele($idUzivatele) {
    Db::dotaz("
      DELETE FROM uzivatel
      WHERE ID_uzivatele = ?
    ", array($idUzivatele));
  }
  
  
  //zahashuje heslo
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
    $kod = ""; 

    while ($i <= 40) { 
        $num = rand() % 33; 
        $j = substr($znaky, $num, 1); 
        $kod = $kod . $j; 
        $i++; 
    } 

    return $kod; 

} 
  //funkce ověří zda má email správný tvar dle příkladu jmeno@domena.koncovka
  public function overEmail($mail){
    
    if (filter_var($mail, FILTER_VALIDATE_EMAIL)) {
    echo "Email je platny.\n";
    return true;
    }
    else{
     echo '<script>alert("Tohle není platná emailova adresa")</script>';
     return false;
    
    } 
  
  }
  
  
  //funkce oveří zda se v databázi již nenachází někdo se stejnou přezdívkou nebo emailem
  public function neopakujSe($udaje){

    $prezdivky = Db::dotazVsechny("
      SELECT prezdivka
      FROM uzivatel
      ORDER BY prezdivka
    ");
     $emaily = Db::dotazVsechny("
      SELECT email
      FROM uzivatel
      ORDER BY email
    ");
     $existujePrezdivka = 0;
     $existujeEmail = 0;
  
    foreach ($prezdivky as $prezdivka){
    if(array_search($udaje["prezdivka"], $prezdivka)) $existujePrezdivka=1;
    }
    if($existujePrezdivka){
    echo "Prezdivka jiz existuje";
    return false;
    }
  
    foreach ($emaily as $email){
    if(array_search($udaje["email"], $email)) $existujeEmail=1;
    }
    if($existujeEmail){
    echo "Email jiz existuje";
    return false;
    }

    if(!$existujeEmail && !$existujePrezdivka){
      echo "vse v poradku";
      return true;  
    }


  }
  
}
?>