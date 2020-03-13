<?php
class EditaceVideaKontroler extends Kontroler {
  public function zpracuj($parametry){
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
    $spravceVidea = new SpravceVidea();
    $spravceHer = new SpravceHer();

    if (!empty($_POST)) {
    if(preg_match("/(youtube.com|youtu.be)\/(watch)?(\?v=)?(\S+)?/", $_POST["link"]))      
      $spravceVidea->ulozVideo($_POST);
    else
      $this->presmeruj("chyba");

      $this->presmeruj("video");
    }
    
    if (!empty($parametry[0]))
    {
      $video = $spravceVidea->vratVideo($parametry[0]);
    }
    else
      $video = $spravceVidea->pripravPrazdnePoleVidea();
    
     $hry=$spravceHer->vratVsechnyHry();
     if(!empty($video["id_hry"]))
     $video["Jmeno"]=$spravceHer->priradKIDNazevHry($video["id_hry"]);
     
    $this->data["hry"] = $hry; 
    $this->data["video"] = $video;
    $this->pohled = "editaceVidea";
  }
}
?>