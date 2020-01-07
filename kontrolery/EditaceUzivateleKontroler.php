<?php
class EditaceUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    
    if (!empty($_POST)) {    
      $kod=$spravceUzivatelu->vygenerujNahodnyKod();
      $spravceUzivatelu->ulozUzivatele($_POST,$kod); 
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