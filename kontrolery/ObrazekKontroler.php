<?php
class ObrazekKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
    $spravceObrazku = new SpravceObrazku();
    $spravceHer = new SpravceHer();
    
    if (!empty($parametry[1]) && $parametry[1] == "odstranit")
    {
      
      $data = $spravceObrazku->vratObrazek($parametry[0]);
      $spravceObrazku->odstranObrazek($data);
      
      $this->presmeruj("obrazek");
    }
    
    
    
    $obrazek = $spravceObrazku->vratVsechnyObrazky();

    
    foreach($obrazek as &$obr){
     
     $obr["download"] = "Obrazky/Hry/".$obr["id_hry"]."/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);
     $obr["nahled"] = "Obrazky/Hry/".$obr["id_hry"]."/zmenseny/".$obr["id_hry"]."-".$obr["id_obr"].$spravceObrazku->priradKoncovku($obr["typ"]);                              
   }      
        
    
    $this->data["obrazek"] = $obrazek;
    $this->pohled = "obrazek";
  }
}
?>