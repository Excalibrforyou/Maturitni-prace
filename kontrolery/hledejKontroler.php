<?php
class HledejKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
  
  
    $spravceVyhledavani = new SpravceVyhledavani();
    $spravceHer = new SpravceHer(); 
    $zanryProDaneHry= array();  
         
    if(isset($_POST["vyhledavani"])){
    if(preg_match("/^[a-zA-Z0-9]+$/", $_POST["vyhledavani"])){
    $vysledky = $spravceVyhledavani->hledej($_POST["vyhledavani"]);
    }      
    else $this->presmeruj("uvod");
    
    } 
    else $this->presmeruj("uvod");

    $hry = $spravceHer->vratVsechnyHry();  
                                         

   foreach($hry as $hra){
     $zanryProDaneHry = array_merge($zanryProDaneHry,$spravceHer->vratZanryHry($hra["id_hry"]));
   }     


    $this->data["vysledky"] = $vysledky;
    $this->data["zanry"] = $zanryProDaneHry;
    $this->pohled = "vyhledavani";
  }
}
?>