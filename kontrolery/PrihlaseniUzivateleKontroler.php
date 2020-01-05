<?php
class PrihlaseniUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    
    if ($prihlasenyUzivatel = 
          $spravceUzivatelu->vratUdajePrihlasenehoUzivatele())
      $this->presmeruj("");    
    
    if (!empty($_POST))
    {
      if ($uzivatel = $spravceUzivatelu->prihlas($_POST["prezdivka"], $_POST["heslo"]))
        $this->presmeruj("");
    }
  
    $this->pohled = "prihlaseniUzivatele";
  }
}                                   
?>