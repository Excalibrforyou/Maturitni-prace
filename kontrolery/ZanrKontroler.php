<?php
class ZanrKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceZanru = new SpravceZanru();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceZanru->odstranZanr($parametry[0]);
    }
    
    $zanr = $spravceZanru->vratVsechnyZanry();
  
    $this->data["zanr"] = $zanr;
    $this->pohled = "zanr";
  }
}
?>