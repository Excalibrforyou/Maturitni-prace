<?php
class EditaceZanruHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceZanraHra = new SpravceZanrHra();


    if (!empty($_POST)) {
      $spravceZanraHra->ulozZanrHru($_POST);
      
      $this->presmeruj("zanrHra");
    }
    if (!empty($parametry[0])&&!empty($parametry[1]))
    {
      $zanrhra = $spravceZanraHra->vratJmenoIdObou($parametry[0],$parametry[1]);
    }
    else
      $zanrhra = $spravceZanraHra->pripravPrazdnePoleZanrHry();
    
    $zanry = $spravceZanraHra->vratVsechnyZanry();
    $hry = $spravceZanraHra->vratVsechnyHry();            
    $this->data["zanry"] = $zanry;
    $this->data["hry"] = $hry;
    $this->data["zanrhra"] = $zanrhra;
    $this->pohled = "editaceZanruHry";                
  }
}
?>