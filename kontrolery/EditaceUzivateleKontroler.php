<?php
class EditaceUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
          $spravceUzivatelu = new SpravceUzivatelu();
          
       
    if($_SESSION["uzivatel"]["typ_uctu"]=="A"){ 
    if(!empty($_POST)){
    if($spravceUzivatelu->overEmail($_POST["email"])){
         $spravceUzivatelu->ulozUzivatele($_POST); 
     }
     
      $this->presmeruj("uzivatele");
    }
    
    if(!empty($parametry[0]))
    {
      $uzivatel = $spravceUzivatelu->vratUzivatele($parametry[0]);
    }
    else
      $uzivatel = $spravceUzivatelu->pripravPrazdnePoleUzivatele();
     }
     
     
      if ($_SESSION["uzivatel"]["typ_uctu"]=="1"){
        if($_SESSION["uzivatel"]["ID_uzivatele"]==$parametry[0]){
    if (!empty($_POST)) {
    if($spravceUzivatelu->overEmail($_POST["email"])){
         $spravceUzivatelu->ulozUzivatele($_POST);  
     }
     
      $this->presmeruj("uvod");
    }
    
    if (!empty($parametry[0]))
    {
      $uzivatel = $spravceUzivatelu->vratUzivatele($parametry[0]);
    }
        
        
        }
        else{$this->presmeruj("editace-uzivatele/".$_SESSION["uzivatel"]["ID_uzivatele"]);}
      }

       if($_SESSION["uzivatel"]["typ_uctu"]=="0"){ 
       
       
         $this->presmeruj("uvod");
       
       }
  
  
    $this->data["uzivatel"] = $uzivatel;
    $this->pohled = "editaceUzivatelu";
  }
}
?>