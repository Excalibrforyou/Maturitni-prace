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
      $udajeUzivateleDB["typ_uctu"] = 0;
      if($this::neopakujSe($udajeUzivatele))  
      Db::vloz("uzivatel", $udajeUzivateleDB);
      return 1;
    }
    else
    { 
      if ($udajeUzivatele["heslo"] != "") 
        $udajeUzivateleDB["heslo"] = $hashHesla;
        
        if($this::neopakujSeVUprave($udajeUzivatele)){
      Db::zmen("uzivatel", $udajeUzivateleDB, 
               "WHERE ID_uzivatele = ?", array($udajeUzivatele["ID_uzivatele"])); }
               return 1;
    }
    return 0;           
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
 //   echo "Email je platny.\n";
    return true;
    }
    else{
   // echo '<script>alert("Tohle není platná emailova adresa")</script>';
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
//    echo "Prezdivka jiz existuje";
    return false;
    }
  
    foreach ($emaily as $email){
    if(array_search($udaje["email"], $email)) $existujeEmail=1;
    }
    if($existujeEmail){
  //  echo "Email jiz existuje";
    return false;
    }

    if(!$existujeEmail && !$existujePrezdivka){
   //   echo "vse v poradku";
      return true;  
    }


  }
  
    public function neopakujSeVUprave($udaje){



    $prezdivky = Db::dotazVsechny("
      SELECT prezdivka
      FROM uzivatel
      where ID_uzivatele != ?
      ORDER BY prezdivka
    ", array($udaje["ID_uzivatele"]));
    
     $emaily = Db::dotazVsechny("
      SELECT email
      FROM uzivatel
      where ID_uzivatele != ?
      ORDER BY email
    ", array($udaje["ID_uzivatele"]));
    
     $existujePrezdivka = 0;
     $existujeEmail = 0;
  
    foreach ($prezdivky as $prezdivka){
    if(array_search($udaje["prezdivka"], $prezdivka)) $existujePrezdivka=1;
    }
    if($existujePrezdivka){
  //  echo "Prezdivka jiz existuje";
    return false;
    }
  
    foreach ($emaily as $email){
    if(array_search($udaje["email"], $email)) $existujeEmail=1;
    }
    if($existujeEmail){
 //   echo "Email jiz existuje";
    return false;
    }

    if(!$existujeEmail && !$existujePrezdivka){
  //    echo "vse v poradku";
      return true;  
    }


  }
 
  public function posliOverovaciMail($data){
  

  $over_email = "http://gamewiki.dx.am/OvereniUzivatele/".$data["over_kod"]."/"; 
   
    
  
   $msg = "Zdravím ".$data["jmeno"]."
   Děkujeme za tvoji registrace na webu GameWiki.
   Zde je tvůj ověřovací odkaz: ".$over_email."
   Po ověření je třeba se znovu přihlásit pomocí přezdívky a hesla pod kterými jsi se zaregistroval.

   S přáním pěkného dne GameWiki.
   ";
   
   
   
// odešle email
  if(mail($data["email"],"Ověření účtu GameWiki",$msg)) return 1;
  else return 0;
  }
  
  
  public function overUzivatele($kod){
                Db::dotaz("UPDATE uzivatel SET typ_uctu = 1 WHERE over_kod = ?", array($kod));
                return 1;            
  } 
  
  public function zmenheslo($data,$stareHeslo,$noveHeslo){

       $hesloZmena["heslo"]=$this->vratHashHesla($noveHeslo);


       $uzivatel = $this->vratUzivatele($data["ID_uzivatele"]);


      if(!empty($data)&&!empty($stareHeslo)){
        if(($data["ID_uzivatele"]==$uzivatel["ID_uzivatele"])){
        if($uzivatel["heslo"]==$this->vratHashHesla($stareHeslo)){
        
                Db::zmen("uzivatel", $hesloZmena, 
               "WHERE ID_uzivatele = ?", array($data["ID_uzivatele"]));
        
        }
        }  
        
        /*if($data["typ_uctu"]=="A"){
        
        
                Db::zmen("uzivatel", $hesloZmena, 
               "WHERE ID_uzivatele = ?", array($data["ID_uzivatele"]));
        
        
        }  */
  }
  }
  
 public function zmenhesloAdmin($data,$noveHeslo){
 
       if(!empty($data)&&!empty($noveHeslo)){
        $hesloZmena["heslo"]=$this->vratHashHesla($noveHeslo);
                
                        Db::zmen("uzivatel", $hesloZmena, 
                        "WHERE ID_uzivatele = ?", array($data));
        
                           
        
        
        
 
 } 
 } 
  
   
} 
?>