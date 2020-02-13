<?php
class NahledHryKontroler extends Kontroler {
  public function zpracuj($parametry) {

    $spravceVidea = new SpravceVidea();
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();
    $spravceZanrHra = new SpravceZanrHra();
    $spravceZanru = new SpravceZanru();
    $spravceHodnoceni = new SpravceHodnoceni();


    if (empty($parametry[0]))
    {
     $this->presmeruj("uvod");
    }
      $hra = $spravceHer->vratHru($parametry[0]);

    if (empty($hra)) {
    $this->presmeruj("uvod");
    }


    $obrazek = $spravceObrazku->vratVsechnyObrazky();
    $video = $spravceVidea->vratVsechnyVidea();
    $zanry = $spravceZanrHra->vratVsechnyZanryHry($hra["id_hry"]);


    foreach ($zanry as &$zanr) {
    	
        $zanr["Zanr"] = $spravceZanru->vratNazevZanru($zanr["id_zanru"]);
    }

    foreach($obrazek as &$obr){

     $obr["download"] = "/Obrazky/Hry/".$obr["id_hry"]."/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);
     $obr["nahled"] = "/Obrazky/Hry/".$obr["id_hry"]."/zmenseny/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);
   }

   foreach ($video as &$vid) {

   $vid["link"] = $spravceVidea->vratEmbedYoutubeLink($vid["link"]);

   }

   $hodnoceni = $spravceHodnoceni->vratVsechnyHodnoceniHry($parametry[0]);




    $this->data["hodnoceni"] = $hodnoceni;
    $this->data["zanry"] = $zanry;
    $this->data["video"] = $video;
    $this->data["obrazky"]=$obrazek;
    $this->data["hra"] = $hra;
    $this->pohled = "nahledHry";
  }
}
?>
