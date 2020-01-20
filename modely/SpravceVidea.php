<?php
class SpravceVidea {
  public function pripravPrazdnePoleVidea() {
    return array(
      "id_vid" => "",
      "link" => "",
      "id_hry" => ""
    );
  }

  public function vratVsechnyVidea() {
    $video = Db::dotazVsechny("
      SELECT v.id_vid,v.link,v.id_hry,h.Jmeno
      FROM video v join hra h ON (v.id_hry = h.id_hry)
    ");
    return $video;
  }
  
  public function vratVideo($idVidea) {
    return Db::dotazJeden("
      SELECT *
      FROM video
      WHERE id_vid = ?
    ", array($idVidea));
  }
  
  public function ulozVideo($udajeVidea) {
    $klice = array(
      "id_vid", "link", "id_hry"
    );
    
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeVideaDB = array_intersect_key($udajeVidea, array_flip($klice)); 

    
    if (empty($udajeVideaDB["id_vid"])){

                      Db::vloz("video", $udajeVideaDB);
       }
       
    else{ 
      Db::zmen("video", $udajeVideaDB, 
               "WHERE id_vid = ?", array($udajeVidea["id_vid"]));
           
    }   
    
  }
  
  
  
       
  public function odstranVideo($data){

    Db::dotaz("
      DELETE FROM video
      WHERE id_vid = ?
    ", array($data["id_vid"])); 
        
  } 
  
   
  public function vratIDPoslednihoVidea(){
  return Db::dotazJeden("
  SELECT id_vid 
  FROM video 
  ORDER BY id_vid DESC LIMIT 1"
  );
  
  
  }
      
   
}
?>