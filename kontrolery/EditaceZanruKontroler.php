<?php
class EditaceZanruKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceZanru = new SpravceZanru();
    
    if (!empty($_POST)) {
      $spravceZanru->ulozZanr($_POST);
      $this->presmeruj("zanr");
    }
    
    if (!empty($parametry[0]))
    {
      $zanr = $spravceZanru->vratZanr($parametry[0]);
    }
    else
      $zanr = $spravceZanru->pripravPrazdnePoleZanru();
    
    $this->data["zanr"] = $zanr;
    $this->pohled = "editaceZanru";
  }
}
?>