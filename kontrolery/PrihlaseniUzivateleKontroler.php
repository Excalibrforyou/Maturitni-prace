<?php
class PrihlaseniUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    

    
  
         
         
    //pokud se chce uživatel odhlásit
    //je li za názvem kontroleru v URL /odhlasit
    if(!empty($parametry[0]) && $parametry[0] == "odhlasit"){
    
      $spravceUzivatelu->odhlas();
      
      $this->presmeruj("uvod");
    
    }
    
    //pokud se uzivatel pokusi vratit na prihlaseni i prestoze je jiz prihlasen vrati se na uvod    
      if ($prihlasenyUzivatel = 
         $spravceUzivatelu->vratUdajePrihlasenehoUzivatele())
         $this->presmeruj("uvod");  
  
    
    if (!empty($_POST))
    {
    
      if ($uzivatel = $spravceUzivatelu->prihlas($_POST["prezdivka"], $_POST["heslo"]))
        $this->presmeruj("uvod");
    }

    $this->pohled = "prihlaseniUzivatele";
  }
}                                   
?>