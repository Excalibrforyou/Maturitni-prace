<?php
class SpravceZanrHra {
  public function pripravPrazdnePoleZanrHry() {
    return array(
      "id_zanru" => "",
      "id_hry" => ""
    );
  }

  public function vratVsechnyZanrHry() {
    $zanrhra = Db::dotazVsechny("
      SELECT *
      FROM zanrhra 
    ");
    return $zanrhra;
  }
 
    public function ulozZanrHru($zanr,$hra) {
    $klice = array(
      "id_zanru", "id_hry"
    );
    $existuje=0; 
    $udajeZanruHry["id_hry"]=$hra;
    $udajeZanruHry["id_zanru"]=$zanr;


    $existujiciZanry = $this::vratVsechnyZanryHry($udajeZanruHry["id_hry"]); 


    foreach ($existujiciZanry as $zanry){
    if(array_search($zanr, $zanry)) $existuje=1;
     }

 
    if($existuje){
      $this::odstranZanrHru($zanr,$udajeZanruHry["id_hry"]);    
    }
    else{                  

       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeZanruHryDB = array_intersect_key($udajeZanruHry, array_flip($klice));
  
          if (empty($udajeZanruHry["id_hry"]&&empty($udajeZanruHry["id_zanru"]))){
               Db::vloz("zanrhra", $udajeZanruHryDB); 

               }
           else{  
                  Db::zmen("zanrhra", $udajeZanruHryDB, 
               "WHERE id_hry = ? AND id_zanru = ?", array($udajeZanruHry["id_hry"],$udajeZanruHry["id_zanru"])); 
               }
       } 
  }    
        
  
  public function odstranZanrHru($idZanru,$idHry) {
    Db::dotaz("
      DELETE FROM zanrhra
      WHERE id_hry = ? AND id_zanru = ?
    ", array($idHry,$idZanru));
  }
  
    public function vratZanrHry($idZanru,$idHry) {
    return Db::dotazJeden("
      SELECT *
      FROM zanrhra
      WHERE id_hry = ? AND id_zanru = ?
    ", array($idHry,$idZanru));
  }
  
  public function vratVsechnyZanryHry($idHry) {
    return Db::dotazVsechny("
      SELECT id_zanru
      FROM zanrhra
      where id_hry = ?
    ", array($idHry)); 

  }
  
}

?>