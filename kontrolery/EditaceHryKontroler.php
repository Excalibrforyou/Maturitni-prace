<?php
class EditaceHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHer = new SpravceHer();
    
       
    
    
    if (!empty($_POST)) {
      $spravceHer->ulozHru($_POST);
      $this->presmeruj("hry");
    }


   

    if (!empty($parametry[0]))
    {
      $hry = $spravceHer->vratHru($parametry[0]);
     
    }
    else{
      $hry = $spravceHer->pripravPrazdnePoleHer();
     } 
      
    
      
    $this->data["hry"] = $hry;
    $this->pohled = "editaceHry";
  }
}
?>