<?php
class ZanrHraKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceZanrHra = new SpravceZanrHra();

    if (!empty($parametry[2]) && $parametry[2] == "odstranit")
    {
      $spravceZanrHra->odstranZanrHru($parametry[0],$parametry[1]);    
    }
    $zanrhra = $spravceZanrHra->vratVsechnyZanrHry();
  
    $this->data["zanrhra"] = $zanrhra;
    $this->pohled = "zanrHra";
  }
}
?>