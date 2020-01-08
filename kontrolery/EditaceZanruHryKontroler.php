<?php
class EditaceZanruHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceZanraHra = new SpravceZanrHra();
    
    if (!empty($_POST)) {
      $spravceZanraHra->ulozZanrHru($_POST);
      
      $this->presmeruj("zanrHra");
    }
    
    if (!empty($parametry[0]))
    {
      $zanrhra = $spravceZanraHra->vratZanrHry($parametry[0],$parametry[1]);
    }
    else
      $zanrhra = $spravceZanraHra->pripravPrazdnePoleZanrHry();
    
    $this->data["zanrhra"] = $zanrhra;
    $this->pohled = "editaceZanruHry";
  }
}
?>