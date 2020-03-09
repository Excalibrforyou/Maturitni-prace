<?php
class EditaceHryKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
       if ($_SESSION["uzivatel"]["typ_uctu"]!="A") {
       $this->presmeruj("uvod");	
     }
  
    $spravceHer = new SpravceHer();
    $spravceZanrHra = new SpravceZanrHra();
    $spravceZanru = new SpravceZanru();    
    $spravceObrazku = new SpravceObrazku();
    
    
    
        
    if (!empty($_POST)) {
    
      $spravceHer->ulozHru($_POST);
    
      if(!empty($_FILES)){
      
       $id_hry=$spravceHer->vratIDPosledniHry();
       
       $pocetSouboru = count($_FILES["obrazek"]["name"]);
        for ($i = 0; $i < $pocetSouboru; $i++){
        
       if($spravceObrazku->ulozObrazek($_POST,$_FILES,$i,$id_hry)){
        if($cesta = $spravceObrazku->uploadMultiple($_FILES,$id_hry,$spravceObrazku->vratIDPoslednihoObrazku(),$i)){  
       $spravceObrazku->upravVelikost($cesta,150,150);        
       
       }  
        }  
       }                                                 
      }
    
    if(isset($_POST["zanr"]))    
    {
    if(!empty($_POST["id_hry"])){
      foreach($_POST["zanr"] as $zanr){
   
       $spravceZanrHra->ulozZanrHru($zanr,$parametry[0]);
     }     
    }
    else{
 
     foreach($_POST["zanr"] as $zanr){    

       $spravceZanrHra->ulozZanrHru($zanr,($spravceHer->vratIDPosledniHry())["id_hry"]);
     } 
    } 
    } 
      
   $this->presmeruj("hry");
    }

 
   

    if (!empty($parametry[0]))
    {
      $hry = $spravceHer->vratHru($parametry[0]);
     $aktualniZanry = $spravceHer->vratZanryHry($hry["id_hry"]);     
     $this->data["aktualniZanry"] = $aktualniZanry;

    }
    else{
      $hry = $spravceHer->pripravPrazdnePoleHer();
     } 
     
      
      
     $zanrhra = $spravceZanrHra->vratVsechnyZanrHry();
     $zanry = $spravceZanru->vratVsechnyZanry();
  
   
    $this->data["zanry"] = $zanry; 
    $this->data["zanrhra"] = $zanrhra;  
    $this->data["hry"] = $hry;
    $this->pohled = "editaceHry";
  }
}
?>