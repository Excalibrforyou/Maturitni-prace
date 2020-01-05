<?php
class SpravceZanru {
  public function pripravPrazdnePoleZanru() {
    return array(
      "id_zanr" => "",
      "nazev" => "",
      "popis" => ""
    );
  }

  public function vratVsechnyZanry() {
    $zanr = Db::dotazVsechny("
      SELECT *
      FROM zanr
    ");
    return $zanr;
  }
  
  public function vratZanr($idZanru) {
    return Db::dotazJeden("
      SELECT *
      FROM zanr
      WHERE id_zanr = ?
    ", array($idZanru));
  }
  
  public function ulozZanr($udajeZanru) {
    $klice = array(
      "id_zanr", "nazev", "popis"
    ); 
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeZanru = array_intersect_key($udajeZanru, array_flip($klice));
  
    if (empty($udajeZanru["id_zanr"]))
      Db::vloz("zanr", $udajeZanru);
    else  
      Db::zmen("zanr", $udajeZanru, 
               "WHERE id_zanr = ?", array($udajeZanru["id_zanr"])); 
  }
  
  public function odstranZanr($idZanru) {
    Db::dotaz("
      DELETE FROM zanr
      WHERE id_zanr = ?
    ", array($idZanru));
  }
}
?>