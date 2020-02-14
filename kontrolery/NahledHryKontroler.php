<?php
class NahledHryKontroler extends Kontroler {
  public function zpracuj($parametry) {

    $spravceVidea = new SpravceVidea();
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();
    $spravceZanrHra = new SpravceZanrHra();
    $spravceZanru = new SpravceZanru();
    $spravceHodnoceni = new SpravceHodnoceni();
    $overeni["uzivatel"] = 1;

    if (empty($parametry[0]))
    {
     $this->presmeruj("uvod");
    }
      $hra = $spravceHer->vratHru($parametry[0]);

    if (empty($hra)) {
    $this->presmeruj("uvod");
    }
    

    if(empty($_SESSION["uzivatel"])||$_SESSION["uzivatel"]["typ_uctu"]=="0"){
    $overeni["uzivatel"] = 0;
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
    $jizExistuje = $spravceHodnoceni->existujeHodnoceni($parametry[0],$_SESSION["uzivatel"]["ID_uzivatele"]);
    
    
   if(empty($jizExistuje)){
      $overeni["hodnoceni"] = 0;
    }
    else $overeni["hodnoceni"] = 1;
   
   $hodnoceni = $spravceHodnoceni->vratVsechnyHodnoceniHry($parametry[0]);
   $hra["celkoveHodnoceni"] = $spravceHodnoceni->vratCelkoveHodnoceni($parametry[0]);
    
   
    
    $this->data["overeni"] = $overeni;
    $this->data["hodnoceni"] = $hodnoceni;
    $this->data["zanry"] = $zanry;
    $this->data["video"] = $video;
    $this->data["obrazky"]=$obrazek;
    $this->data["hra"] = $hra;
    $this->pohled = "nahledHry";
  }
}
?>
