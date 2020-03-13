<?php
class EditaceHodnoceniUKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
  
    $spravceHodnoceni = new SpravceHodnoceni();
    $spravceHer = new SpravceHer();
    
    if(empty($_SESSION["uzivatel"])||$_SESSION["uzivatel"]["typ_uctu"]=="0"||empty($parametry[0])){
    $this->presmeruj("uvod");
    }
    
        if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {     
       $dataProOdstraneni = $spravceHodnoceni->vratHodnot($parametry[2]);
       if($_SESSION["uzivatel"]["ID_uzivatele"]==$dataProOdstraneni["id_uzivatele"]){
      $spravceHodnoceni->odstranHodnoceni($parametry[2]);   
      }                                                                         
      $this->presmeruj("nahledHry/".$parametry[0]);
    }
    
    
    
    if (!empty($_POST)) {
      $spravceHodnoceni->ulozHodnoceni($_POST);
      $this->presmeruj("nahledHry/".$_POST["id_hry"]);
    }
    if (!empty($parametry[0])){
    $data = $spravceHodnoceni->existujeHodnoceni($parametry[0],$_SESSION["uzivatel"]["ID_uzivatele"]);
    }
     
     
    if (!empty($data))
    {
      $hodnoceni=$data;
    }
    else{
      $hodnoceni = $spravceHodnoceni->pripravPrazdnePoleHodnoceni();
      $hodnoceni["id_hry"]=$parametry[0];
     }
    
    if(!empty($hodnoceni["id_hry"])){
    $pomocnik=$spravceHer->priradKIDNazevHry($hodnoceni["id_hry"]);
    $hodnoceni["Jmeno"]=$pomocnik["Jmeno"];  
    }
    
     
    $this->data["hodnoceni"] = $hodnoceni;
    $this->pohled = "editaceHodnoceniU";
  }
}
?>