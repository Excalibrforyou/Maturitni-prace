<?php
class SpravceObrazku {
  public function pripravPrazdnePoleObrazku() {
    return array(
      "id_obr" => "",
      "nazev_obr" => "",
      "cesta" => "",
      "id_hry" => ""
    );
  }

  public function vratVsechnyObrazky() {
    $obraz = Db::dotazVsechny("
      SELECT o.id_obr,o.nazev_obr,o.cesta,o.id_hry,h.Jmeno
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
  
  public function ulozObrazek($udajeObrazku) {
    $klice = array(
      "id_obr", "nazev_obr", "cesta","id_hry"
    );
    

         
    
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeObrazkuDB = array_intersect_key($udajeObrazku, array_flip($klice)); 
    
    
    $udajeUzivateleDB["cesta"] = "Obrazky/Hry/".$udajeObrazku["id_hry"]."/"; 
    echo '<script>alert("Welcome to Geeks for Geeks")</script>';
    if (empty($udajeObrazku["id_obr"])){
    $udajeUzivateleDB["cesta"] = "Obrazky/Hry/".$udajeObrazku["id_hry"]."/"; 
                      Db::vloz("obrazek", $udajeObrazkuDB);
                         

      
       }
       
    else{ 
      Db::zmen("obrazek", $udajeObrazkuDB, 
               "WHERE id_obr = ?", array($udajeObrazku["id_obr"]));
           
    }  
   
  }
  
  
  
       
  public function odstranObrazek($idObrazku) {
    Db::dotaz("
      DELETE FROM obrazek
      WHERE id_obr = ?
    ", array($idObrazku));
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
                echo $noveJmeno . " již existuje.";
            } else{
            if (!file_exists("Obrazky/Hry/" . $idHry)) {
            mkdir("Obrazky/Hry/" . $idHry, 0777, true);
            }
                move_uploaded_file($obrazek["obrazek"]["tmp_name"], "Obrazky/Hry/" . $idHry . "/". $noveJmeno);
                
            }
             
        } else{
            echo "Špatný formát"; 
        }
   }
   
  public function vratIDPoslednihoObrazku(){
  return Db::dotazJeden("
  SELECT id_obr 
  FROM obrazek 
  ORDER BY id_obr DESC LIMIT 1"
  );
  
  
  }   
   
}
?>
