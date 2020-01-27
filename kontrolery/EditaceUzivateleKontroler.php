<?php
class EditaceUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceUzivatelu = new SpravceUzivatelu();
    
    if (!empty($_POST)) {
    if($spravceUzivatelu->overEmail($_POST["email"])){
         $spravceUzivatelu->ulozUzivatele($_POST);  
     }
     
      $this->presmeruj("uzivatele");
    }
    
    if (!empty($parametry[0]))
    {
      $uzivatel = $spravceUzivatelu->vratUzivatele($parametry[0]);
    }
    else
      $uzivatel = $spravceUzivatelu->pripravPrazdnePoleUzivatele();
    
    $this->data["uzivatel"] = $uzivatel;
    $this->pohled = "editaceUzivatelu";
  }
}
?>