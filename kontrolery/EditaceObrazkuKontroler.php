<?php
class EditaceObrazkuKontroler extends Kontroler {
  public function zpracuj($parametry){
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();

    if (!empty($_POST)) {      
      $spravceObrazku->ulozObrazek($_POST,$_FILES,-10,-10);   
      $cesta = $spravceObrazku->upload($_FILES,$_POST["id_hry"],$spravceObrazku->vratIDPoslednihoObrazku());    
      $spravceObrazku->upravVelikost($cesta,150,150);
      $this->presmeruj("obrazek");
    }
    
    if (!empty($parametry[0]))
    {
          $this->presmeruj("editace-obrazku");
    }
    else
      $obrazek = $spravceObrazku->pripravPrazdnePoleObrazku();
    
     $hry=$spravceHer->vratVsechnyHry();
     if(!empty($obrazek["id_hry"]))
     $obrazek["Jmeno"]=$spravceHer->priradKIDNazevHry($obrazek["id_hry"]);
     
    $this->data["hry"] = $hry; 
    $this->data["obrazek"] = $obrazek;
    $this->pohled = "editaceObrazku";
  }
}
?>