<?php
class ZmenaHeslaKontroler extends Kontroler {
  public function zpracuj($parametry) {     
   $spravceUzivatelu = new SpravceUzivatelu();
   
   $bum = $spravceUzivatelu->vratUdajePrihlasenehoUzivatele();
   
    if($bum["typ_uctu"]!="1" && $bum["typ_uctu"]!="A"){

       $this->presmeruj("chyba");
     
     }else{
    
                                                                                                                                                                              
       if(!empty($parametry[0])&&($_SESSION["uzivatel"]["typ_uctu"]=='A')){    
       $this->data["id_zmeny"] = $parametry[0]; 
       } 
       
       
        if(!empty($_POST["uzivatel"]) && $_SESSION["uzivatel"]["typ_uctu"]=='A'){
        $spravceUzivatelu->zmenhesloAdmin($_POST["uzivatel"],$_POST["heslo"]); 
        
        $this->presmeruj("uzivatele");
        }
    
    
    if (!empty($_POST))
    {
      $spravceUzivatelu->zmenheslo($spravceUzivatelu->vratUdajePrihlasenehoUzivatele(),$_POST["stareHeslo"],$_POST["heslo"]);
    }
    }
    $this->pohled = "zmenaHesla";
  }
}                                   
?>