<?php
class HryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHer = new SpravceHer();
    
    
    
    $hryy = array();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceHer->odstranHru($parametry[0]);
      $this->presmeruj("hry");
    }
    
    $hry = $spravceHer->vratVsechnyHry();  
                                                

   foreach($hry as $hra){

     $hryy = array_merge($hryy,$spravceHer->vratZanryHry($hra["id_hry"]));
   }      

                       
    
    $this->data["hryy"] = $hryy ;
    $this->data["hry"] = $hry;
    $this->pohled = "hra";
  }
}
?>