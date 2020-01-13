<?php
class EditaceObrazkuKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();

    if (!empty($_POST)) {  
      $uploaded = $spravceObrazku->upload($_FILES,$_POST["id_hry"],$spravceObrazku->vratIDPoslednihoObrazku());
      $spravceObrazku->ulozObrazek($_POST,$uploaded);   

      $this->presmeruj("obrazek");
    }
    
    if (!empty($parametry[0]))
    {
      $obrazek = $spravceObrazku->vratObrazek($parametry[0]);
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