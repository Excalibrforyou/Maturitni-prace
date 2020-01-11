<?php
class ObrazekKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceObrazku->odstranObrazek($parametry[0]);
      $this->presmeruj("obrazek");
    }
    
    $obrazek = $spravceObrazku->vratVsechnyObrazky();

  
    $this->data["obrazek"] = $obrazek;
    $this->pohled = "obrazek";
  }
}
?>