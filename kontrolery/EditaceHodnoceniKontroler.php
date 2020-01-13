<?php
class EditaceHodnoceniKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHodnoceni = new SpravceHodnoceni();
    $spravceHer = new SpravceHer();
    
    if (!empty($_POST)) {
      $spravceHodnoceni->ulozHodnoceni($_POST);
      $this->presmeruj("hodnoceni");
    }
    
    if (!empty($parametry[0]))
    {
      $hodnoceni = $spravceHodnoceni->vratHodnot($parametry[0]);
    }
    else
      $hodnoceni = $spravceHodnoceni->pripravPrazdnePoleHodnoceni();
    
    $hry=$spravceHer->vratVsechnyHry();
    if(!empty($hodnoceni["id_hry"]))
    $hodnoceni["Jmeno"]=$spravceHer->priradKIDNazevHry($hodnoceni["id_hry"]);
     
  
    
    
    $this->data["hry"] = $hry;
    $this->data["hodnoceni"] = $hodnoceni;
    $this->pohled = "editaceHodnoceni";
  }
}
?>