<?php
class EditaceHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceHer = new SpravceHer();
    $spravceZanrHra = new SpravceZanrHra();   
    $spravceZanru = new SpravceZanru();
    
       
    
    
    if (!empty($_POST)) {
      $spravceHer->ulozHru($_POST);
      $spravceZanrHra->ulozZanrHru($_POST);
      $this->presmeruj("hry");
    }


   

    if (!empty($parametry[0]))
    {
      $hry = $spravceHer->vratHru($parametry[0]);
     $this->data["PorovZanru"] = $spravceHer->vratZanryHry($parametry[0]);
     
    }
    else{
      $hry = $spravceHer->pripravPrazdnePoleHer();
     $this->data["PorovZanru"] = $spravceZanrHra->pripravPrazdnePoleZanrHry();
     } 
      
    $zanry = $spravceZanru->vratVsechnyZanry();
      
    $this->data["zanry"] = $zanry;
    $this->data["hry"] = $hry;
    $this->pohled = "editaceHry";
  }
}
?>