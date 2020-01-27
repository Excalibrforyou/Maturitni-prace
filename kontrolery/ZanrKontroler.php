<?php
class ZanrKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceZanru = new SpravceZanru();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceZanru->odstranZanr($parametry[0]);
      $this->presmeruj("zanr");
    }
    
    $zanr = $spravceZanru->vratVsechnyZanry();
  
    $this->data["zanr"] = $zanr;
    $this->pohled = "zanr";
  }
}
?>