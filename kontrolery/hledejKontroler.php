<?php
class hledejKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceVyhledavani = new SpravceVyhledavani();
    $spravceHer = new SpravceHer(); 
    if(isset($_POST["vyhledavani"])){
    if(preg_match("/^[a-zA-Z0-9]+$/", $_POST["vyhledavani"])){
    $vysledky = $spravceVyhledavani->hledej($_POST["vyhledavani"]);
    }
    else $this->presmeruj("uvod");
    }
    else $this->presmeruj("uvod");
    
    $this->data["vysledky"] = $vysledky;
    $this->pohled = "vyhledavani";
  }
}
?>