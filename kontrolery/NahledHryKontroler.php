<?php
class NahledHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
    $spravceVidea = new SpravceVidea(); 
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();
    $hryy = array();
    

    
    if (empty($parametry[0]))
    {                
     $this->presmeruj("uvod");
    }
      $hra = $spravceHer->vratHru($parametry[0]);   
 
    if (empty($hra)) {
    $this->presmeruj("uvod");	
    }
    
    
    $obrazek = $spravceObrazku->vratVsechnyObrazky();

    
    foreach($obrazek as &$obr){
     
     $obr["download"] = "/Obrazky/Hry/".$obr["id_hry"]."/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);
     $obr["nahled"] = "/Obrazky/Hry/".$obr["id_hry"]."/zmenseny/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);                              
   } 
   
      $video = $spravceVidea->vratVsechnyVidea();   
   
     foreach ($video as &$vid) {
     
     $vid["link"] = $spravceVidea->vratEmbedYoutubeLink($vid["link"]);
     	
     }
 /*   
    
    $hry = $spravceHer->    
    $hra = $spravceHer->vratHru();    
                                                
  foreach($hry as $hra){

     $hryy = array_merge($hryy,$spravceHer->vratZanryHry($hra["id_hry"]));
   }      
       */
  
     

  
  
  
                       
    $this->data["video"] = $video;   
    $this->data["obrazky"]=$obrazek;
    $this->data["hryy"] = $hryy;
    $this->data["hra"] = $hra;
    $this->pohled = "hraN";
  }
}
?>