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
      $zanr = $spravceHer->vratZanryHry($parametry[0]);
      print_r($zanr);  
    }
    else{
      $hry = $spravceHer->pripravPrazdnePoleHer();
      $zanr = $spravceZanrHra->pripravPrazdnePoleZanrHry();
     } 
      
    $zanry = $spravceZanru->vratVsechnyZanry();
    
    $this->data["PorovZanru"]= $zanr;     
    $this->data["zanry"] = $zanry;
    $this->data["hry"] = $hry;
    $this->pohled = "editaceHry";
  }
}
?>