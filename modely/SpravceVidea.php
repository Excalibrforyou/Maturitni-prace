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
  
    public function ulozVideoMultiple($link,$idhry) {
    $klice = array(
      "id_vid", "link", "id_hry"
    );
    $pole = array(
    "id_vid" => NULL,
    "link" => $link,
    "id_hry" => $idhry
    
    );
    
    
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeVideaDB = array_intersect_key($pole, array_flip($klice)); 
    
    if(!empty($link)){
    if(empty($udajeVideaDB["id_vid"])){

                      Db::vloz("video", $udajeVideaDB);
       }
  
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
  
  public function vratEmbedYoutubeLink($url){
  
     $typKratka = '/youtu.be\/([a-zA-Z0-9_-]+)\??/i';
     $typDlouha = '/youtube.com\/((?:embed)|(?:watch))((?:\?v\=)|(?:\/))([a-zA-Z0-9_-]+)/i';

    if (preg_match($typDlouha, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }

    if (preg_match($typKratka, $url, $matches)) {
        $youtube_id = $matches[count($matches) - 1];
    }
    return 'https://www.youtube.com/embed/' . $youtube_id ;

         
  }  
    
      
   
}
?>