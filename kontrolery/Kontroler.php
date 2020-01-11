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
  
  public function pridejZpravu($typ,$zprava){
   $_SESSION["zpravy"][] = array(
   "typ" => $typ,
   "zprava" => $zprava 
   ); 
  }
   
   public function vratZpravy(){
   if(isset($_SESSION["zpravy"]))
     {
   $zpravy = $_SESSION["zpravy"];
   unset($_SESSION["zpravy"]);
   return $zpravy;
     }
   else 
     return array();
   } 
   
    
  abstract function zpracuj($parametry);
}
?>