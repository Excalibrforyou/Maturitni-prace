<?php
class EditaceHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHer = new SpravceHer();
    $spravceZanrHra = new SpravceZanrHra();
    $spravceZanru = new SpravceZanru();  
        
    if (!empty($_POST)) {
      $spravceHer->ulozHru($_POST);
    
    if(isset($_POST["zanr"]))    
    {
    if(!empty($_POST["id_hry"])){
      foreach($_POST["zanr"] as $zanr){    
     
       $spravceZanrHra->ulozZanrHru($zanr,$parametry[0]);
     }     
    }
    else 
     foreach($_POST["zanr"] as $zanr){    
     
       $spravceZanrHra->ulozZanrHru($zanr,$spravceHer->vratIDPosledniHry());
     }  
    } 
      
   $this->presmeruj("hry");
    }

 
   

    if (!empty($parametry[0]))
    {
      $hry = $spravceHer->vratHru($parametry[0]);
     
    }
    else{
      $hry = $spravceHer->pripravPrazdnePoleHer();
     } 
      
     $zanrhra = $spravceZanrHra->vratVsechnyZanrHry();
     $zanry = $spravceZanru->vratVsechnyZanry();
  
    $this->data["zanry"] = $zanry; 
    $this->data["zanrhra"] = $zanrhra;  
    $this->data["hry"] = $hry;
    $this->pohled = "editaceHry";
  }
}
?>