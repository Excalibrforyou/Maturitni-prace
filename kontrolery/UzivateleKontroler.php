<?php
class UzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceUzivatelu->odstranUzivatele($parametry[0]);
       $this->presmeruj("uzivatele");
    }
    
    $uzivatel = $spravceUzivatelu->vratVsechnyUzivatele();
  
    $this->data["uzivatel"] = $uzivatel;
    $this->pohled = "uzivatel";
  }
}
?>