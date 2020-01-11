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
      SELECT *
      FROM obrazek
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
    
  
    if (empty($udajeObrazku["id_obr"])){ 
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
  
  public function upload($obrazek,$idHry){

    $povoleneTypy = array("image/jpeg", "image/png", "image/gif"); 
      
        $jmeno = $obrazek["obrazek"]["name"];
        $typSouboru = $obrazek["obrazek"]["type"];
        $velikostSouboru = $obrazek["obrazek"]["size"];
    
        //Ověří zda je soubor platného formátu

        if(in_array($typSouboru, $povoleneTypy)){

            
            //Zjisti zde existuje soubor se stejnym jmenem
            if(file_exists("Obrazky/Hry/" . $idHry . "/". $jmeno)){
                echo $jmeno . " již existuje.";
            } else{
            if (!file_exists("Obrazky/Hry/" . $idHry)) {
            mkdir("Obrazky/Hry/" . $idHry, 0777, true);
            }
                move_uploaded_file($obrazek["obrazek"]["tmp_name"], "Obrazky/Hry/" . $idHry . "/". $jmeno);
                
            }
             
        } else{
            echo "Špatný formát"; 
        }



  
  
}
}
?>