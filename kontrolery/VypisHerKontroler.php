<?php
class VypisHerKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
  
    $spravceHer = new SpravceHer(); 
    $zanryProDaneHry= array();  

    $hry = $spravceHer->vratVsechnyHry();  
                                    
                                    
                                    
                                    
                                    
                                    


    $this->data["hry"] = $hry;
    $this->pohled = "vypisHer";
  }
}
?>