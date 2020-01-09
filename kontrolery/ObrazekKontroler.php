<?php
class ObrazekKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceObrazku = new SpravceObrazku();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceObrazku->odstranObrazek($parametry[0]);
    }
    
    $obrazek = $spravceObrazku->vratVsechnyObrazky();
  
    $this->data["obrazek"] = $obrazek;
    $this->pohled = "obrazek";
  }
}
?>