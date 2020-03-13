<?php
class SpravceObrazku {
  public function pripravPrazdnePoleObrazku() {
    return array(
      "id_obr" => "",
      "typ" => "",
      "id_hry" => ""
    );
  }


 
  public function vratObrazky() {
    $obraz = Db::dotazVsechny("
    select *
    from obrazek
    ");
    return $obraz;
  }
  
    public function vratObrazkyKID($idhry) {
    $obraz = Db::dotazVsechny("
    select *
    from obrazek
    where id_hry = ?
    ", array($idhry));
    return $obraz;
  }
  

  public function vratVsechnyObrazky() {
    $obraz = Db::dotazVsechny("
      SELECT o.id_obr,o.typ,o.id_hry,h.Jmeno
      FROM obrazek o join hra h ON (o.id_hry = h.id_hry)
    ");
    return $obraz;                             
  }
  
  public function vratObrazek($idObrazku) {
    return Db::dotazJeden("
      SELECT *
      FROM obrazek
      WHERE id_obr = ?
    ", array($idObrazku));
  }
  
  public function ulozObrazek($udajeObrazku,$obrazek,$i,$id_hry) {
    $klice = array(
      "id_obr", "typ", "id_hry"
    );

       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeObrazkuDB = array_intersect_key($udajeObrazku, array_flip($klice)); 

      

    
    if (empty($udajeObrazku["id_obr"])){
       if($i==-10 && $id_hry==-10){
       $udajeObrazkuDB["typ"] = $obrazek["obrazek"]["type"];
       }
       else{
       $udajeObrazkuDB["typ"] = $obrazek["obrazek"]["type"][$i];
       $udajeObrazkuDB["id_hry"] = $id_hry["id_hry"];
       }


                      Db::vloz("obrazek", $udajeObrazkuDB);
                      return true;   

      
       }
       
    else{ 
      Db::zmen("obrazek", $udajeObrazkuDB, 
               "WHERE id_obr = ?", array($udajeObrazku["id_obr"]));
               return true;  
    }
    
   return false;   
   
  }
  
  
  
       
  public function odstranObrazek($data){
    
      $udaje = $this->vratObrazek($data["id_obr"]); 
    $koncovka = array(
    "image/jpeg"  => ".jpg",
    "image/png" => ".png",
    "image/gif" => ".gif"
     );
     
    
  if (unlink("Obrazky/Hry/".$data["id_hry"]."/".$data["id_hry"]."-".$data["id_obr"].$koncovka[$udaje["typ"]])) {
      unlink("Obrazky/Hry/".$data["id_hry"]."/zmenseny/".$data["id_hry"]."-".$data["id_obr"].$koncovka[$udaje["typ"]]);
    Db::dotaz("
      DELETE FROM obrazek
      WHERE id_obr = ?
    ", array($data["id_obr"])); 
    return 1;
   }      
     
   return 0; 
  } 
  
  public function upload($obrazek,$idHry,$id_obrazku){

    $povoleneTypy = array("image/jpeg", "image/png", "image/gif"); 
    $koncovka = array(
    "image/jpeg"  => ".jpg",
    "image/png" => ".png",
    "image/gif" => ".gif"
); 
      
        $puvodniJmeno = $obrazek["obrazek"]["name"];
        $noveJmeno = $idHry."-".$id_obrazku["id_obr"];
        $typSouboru = $obrazek["obrazek"]["type"];
        $velikostSouboru = $obrazek["obrazek"]["size"];
        
        //Ověří zda je soubor platného formátu
        if(in_array($typSouboru, $povoleneTypy)){
        
        // prida za nove vytvorene jmeno koncovku podle typu souboru 
         $noveJmeno = $noveJmeno.$koncovka[$obrazek["obrazek"]["type"]];
            
            //Zjisti zde existuje soubor se stejnym jmenem
            if(file_exists("Obrazky/Hry/" . $idHry . "/". $noveJmeno)){
               // echo $noveJmeno . " již existuje.";
            } else{
            if (!file_exists("Obrazky/Hry/" . $idHry)) {
            mkdir("Obrazky/Hry/" . $idHry, 0777, true);
            }
                move_uploaded_file($obrazek["obrazek"]["tmp_name"], "Obrazky/Hry/" . $idHry . "/". $noveJmeno);
              return  ("Obrazky/Hry/".$idHry."/".$noveJmeno);  
            }
            
        } else{
            //echo "Špatný formát";
        
        }
   }
   
     public function uploadMultiple($obrazek,$idHry,$id_obrazku,$i){

    $povoleneTypy = array("image/jpeg", "image/png", "image/gif"); 
    $koncovka = array(
    "image/jpeg"  => ".jpg",
    "image/png" => ".png",
    "image/gif" => ".gif"
); 
      
      
        $puvodniJmeno = $obrazek["obrazek"]["name"][$i];
        $noveJmeno = $idHry["id_hry"]."-".$id_obrazku["id_obr"];
        $typSouboru = $obrazek["obrazek"]["type"][$i];
        $velikostSouboru = $obrazek["obrazek"]["size"][$i];
        
 
        //Ověří zda je soubor platného formátu
        if(in_array($typSouboru, $povoleneTypy)){
        
        // prida za nove vytvorene jmeno koncovku podle typu souboru 
         $noveJmeno = $noveJmeno.$koncovka[$obrazek["obrazek"]["type"][$i]];
         
 
            //Zjisti zde existuje soubor se stejnym jmenem
            if(file_exists("Obrazky/Hry/" . $idHry["id_hry"] . "/". $noveJmeno)){
               // echo $noveJmeno . " již existuje.";
            } else{
            if (!file_exists("Obrazky/Hry/" . $idHry["id_hry"])) {
            mkdir("Obrazky/Hry/" . $idHry["id_hry"], 0777, true);
            }
                move_uploaded_file($obrazek["obrazek"]["tmp_name"][$i], "Obrazky/Hry/" . $idHry["id_hry"] . "/". $noveJmeno);
              return  ("Obrazky/Hry/".$idHry["id_hry"]."/".$noveJmeno);  
            }
            
        } else{
            //echo "Špatný formát";
        
        }
   }
   
   
   
  public function vratIDPoslednihoObrazku(){
  return Db::dotazJeden("
  SELECT id_obr 
  FROM obrazek 
  ORDER BY id_obr DESC LIMIT 1"
  );
  
  
  }
  
  
 public function priradKoncovku($koncovka){
         $koncovky = array(
    "image/jpeg"  => ".jpg",
    "image/png" => ".png",
    "image/gif" => ".gif"
     );
 
   return $koncovka = $koncovky[$koncovka];
 
 }
  
  public function upravVelikost($obrazek, $sir, $vys){
  
     
    $id = $this->vratIDPoslednihoObrazku();
   
     $data = $this->vratObrazek($id["id_obr"]);
     
     $cilObr = "Obrazky/Hry/".$data["id_hry"]."/zmenseny/";
    
        if (!file_exists("Obrazky/Hry/".$data["id_hry"]."/zmenseny")) {
            mkdir("Obrazky/Hry/".$data["id_hry"]."/zmenseny", 0777, true);
         }
     

     if($data["typ"] == "image/jpeg"){
     
    $cilObr=$cilObr.$data["id_hry"]."-".$data["id_obr"].".jpg"; 
     
   list($sirka, $vyska) = getimagesize($obrazek);
   $zdroj = imagecreatefromjpeg($obrazek);
   $cil = imagecreatetruecolor($sir, $vys);
   imagecopyresampled($cil, $zdroj, 0, 0, 0, 0, $sir, $vys, $sirka, $vyska);  
   imagejpeg($cil,$cilObr);  
     }
     
      if($data["typ"] == "image/png"){
      
     $cilObr=$cilObr.$data["id_hry"]."-".$data["id_obr"].".png"; 
      
   list($sirka, $vyska) = getimagesize($obrazek);
   $zdroj = imagecreatefrompng($obrazek);
   $cil = imagecreatetruecolor($sir, $vys);
   imagecopyresampled($cil, $zdroj, 0, 0, 0, 0, $sir, $vys, $sirka, $vyska);
   imagepng($cil,$cilObr);   
      
      
      } 
     
    if($data["typ"] == "image/gif"){
    
     $cilObr=$cilObr.$data["id_hry"]."-".$data["id_obr"].".gif"; 
    
   list($sirka, $vyska) = getimagesize($obrazek);
   $zdroj = imagecreatefromgif($obrazek);
   $cil = imagecreatetruecolor($sir, $vys);
   imagecopyresampled($cil, $zdroj, 0, 0, 0, 0, $sir, $vys, $sirka, $vyska);
   imagegif($cil,$cilObr);  
    
    
    }
    
   else return false;
   
    
  
  } 
   
   
                 
      
   
}
?>