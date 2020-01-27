<?php
class VideoKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceVidea = new SpravceVidea();
    $spravceHer = new SpravceHer();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      
      $data = $spravceVidea->vratVideo($parametry[0]);
      $spravceVidea->odstranVideo($data);
      
      $this->presmeruj("video");
    }
    
    $video = $spravceVidea->vratVsechnyVidea();

  
    $this->data["video"] = $video;
    $this->pohled = "video";
  }
}
?>