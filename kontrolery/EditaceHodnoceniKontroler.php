<?php
class EditaceHodnoceniKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHodnoceni = new SpravceHodnoceni();
    
    if (!empty($_POST)) {
      $spravceHodnoceni->ulozHodnoceni($_POST);
      $this->presmeruj("hodnoceni");
    }
    
    if (!empty($parametry[0]))
    {
      $hodnoceni = $spravceHodnoceni->vratUzivatele($parametry[0]);
    }
    else
      $hodnoceni = $spravceHodnoceni->pripravPrazdnePoleHodnoceni();
    
    $this->data["hodnoceni"] = $hodnoceni;
    $this->pohled = "editaceHodnoceni";
  }
}
?>