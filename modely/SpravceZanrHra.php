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
    $udajeZanruHry["id_hry"]=$hra["id_hry"];
    $udajeZanruHry["id_zanru"]=$zanr;
    echo "id_hry".$udajeZanruHry["id_hry"];

    $existujiciZanry = array();
    $existujiciZanry = $this::vratVsechnyZanryHry($udajeZanruHry["id_hry"]); 

     print_r($existujiciZanry);

    if(in_array($zanr, $existujiciZanry[0])){
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
    $zanrhra = Db::dotazVsechny("
      SELECT id_zanru
      FROM zanrhra
      where id_hry = ?
    ", array($idHry)); 
    return $zanrhra;
  }
  
}

?>