<?php
abstract class Kontroler {
  protected $data = array();
  protected $pohled = ""; // název pohledu (bez přípony)
  
  public function vypisPohled() {
    if ($this->pohled) {
      extract($this->data);
      require "pohledy/{$this->pohled}.phtml";
    }  
  }
  
  public function presmeruj($url) {
    header("Location: /$url");
    exit;
  }
    
  abstract function zpracuj($parametry);
}
?>