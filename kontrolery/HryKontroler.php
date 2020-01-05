<?php
class HryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHer = new SpravceHer();
    
    $hryy = array();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceHer->odstranHru($parametry[0]);
    }
    
    $hry = $spravceHer->vratVsechnyHry();  
                                                

   foreach($hry as $hryyy){

     $hryy = array_merge($hryy,$spravceHer->vratZanryHry($hryyy["id_hry"]));
   }      
   


      
 print_r($hryy);  

                       
    //https://www.php.net/manual/en/function.array-splice.php
    
    $this->data["hryy"] = $hryy ;
    $this->data["hry"] = $hry;
    $this->pohled = "hra";
  }
}
?>