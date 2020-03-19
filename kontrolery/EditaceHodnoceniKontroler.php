<?php
class EditaceHodnoceniKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
     if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
  
    $spravceHodnoceni = new SpravceHodnoceni();
    $spravceHer = new SpravceHer();
    $spravceUzivatelu = new SpravceUzivatelu();    
    
    
    
    if (!empty($_POST)) {
    if(empty($_POST["id_hod"])){
       if($spravceHodnoceni->existujeHodnoceni($_POST["id_hry"],$_POST["id_uzivatele"])){
             $this->presmeruj("chyba");
       }
      }
      
       if(empty($spravceHodnoceni->existujeHodnoceni($_POST["id_hry"],$_POST["id_uzivatele"]))||($spravceHodnoceni->existujeHodnoceni($_POST["id_hry"],$_POST["id_uzivatele"]))["id_hod"]==$_POST["id_hod"]){

           $spravceHodnoceni->ulozHodnoceni($_POST);
       }
       else $this->presmeruj("chyba");
  
      $this->presmeruj("hodnoceni");
    }
    
    if (!empty($parametry[0]))
    {
      $hodnoceni = $spravceHodnoceni->vratHodnot($parametry[0]);
    }
    else
      $hodnoceni = $spravceHodnoceni->pripravPrazdnePoleHodnoceni();
    
    $hry=$spravceHer->vratVsechnyHry();
    $uzivatele= $spravceUzivatelu->vratVsechnyUzivatele();
    
    if(!empty($hodnoceni["id_hry"])){
    $hodnoceni["Jmeno"]=$spravceHer->priradKIDNazevHry($hodnoceni["id_hry"]); 
    }
    if(!empty($hodnoceni["id_uzivatele"])){
    $hodnoceni["Uzivatel"] = $spravceUzivatelu->priradKIDUzivatele($hodnoceni["id_uzivatele"]);  
    }
    

    $this->data["uzivatele"] = $uzivatele;
    $this->data["hry"] = $hry;
    $this->data["hodnoceni"] = $hodnoceni;
    $this->pohled = "editaceHodnoceni";
  }
}
?>