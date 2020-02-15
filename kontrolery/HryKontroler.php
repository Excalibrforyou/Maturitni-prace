<?php
class HryKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceHer = new SpravceHer();
    
    
    
    $hrySZanry = array();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      $spravceHer->odstranHru($parametry[0]);
      $this->presmeruj("hry");
    }
    
    $hry = $spravceHer->vratVsechnyHry();  
                                                

   foreach($hry as $hra){

     $hrySZanry = array_merge($hrySZanry,$spravceHer->vratZanryHry($hra["id_hry"]));
   }      

                       
    
    $this->data["hryy"] = $hrySZanry;
    $this->data["hry"] = $hry;
    $this->pohled = "hra";
  }
}
?>