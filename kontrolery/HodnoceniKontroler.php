<?php
class HodnoceniKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHodnoceni = new SpravceHodnoceni();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceHodnoceni->odstranHodnoceni($parametry[0]);
      $this->presmeruj("hodnoceni");
    }
    
    $hodnoceni = $spravceHodnoceni->vratHodnoceni();
    
    
    $this->data["hodnoceni"] = $hodnoceni;
    $this->pohled = "hodnoceni";
  }
}
?>