<?php
class RegistraceUzivateleKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceUzivatelu = new SpravceUzivatelu();
    
    if (!empty($_POST)) {
    if($spravceUzivatelu->overEmail($_POST["email"])){
       if($spravceUzivatelu->ulozUzivatele($_POST)){
        if ($uzivatel = $spravceUzivatelu->prihlas($_POST["prezdivka"], $_POST["heslo"])){
             $spravceUzivatelu->posliOverovaciMail($_SESSION["uzivatel"]);
         
        $this->presmeruj("uvod");
           
     }
     }
     }   
     $this->presmeruj("registraceUzivatele");
    }



    $this->pohled = "registraceUzivatele";
  }
}                                   
?>