<?php
class OvereniUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    
    
    if(!empty($parametry[0])){ 
     
    if(!$spravceUzivatelu->overUzivatele($parametry[0])){
    $this->presmeruj("chyba");
    }
    else $spravceUzivatelu->odhlas();   
    }
  
   
    $this->presmeruj("uvod");
  }
}                                   
?>