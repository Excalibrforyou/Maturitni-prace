<?php
class SpravceZanrHra {
  public function pripravPrazdnePoleZanrHry() {
    return array(
      "id_zanru" => "",
      "id_hry" => ""
    );
  }

  public function vratVsechno() {
    $zanrhra = Db::dotazVsechny("
      SELECT *
      FROM zanrhra
    ");
    return $zanrhra;
  }
  
  
    public function ulozZanrHru($udajeZanruHry) {
    $klice = array(
      "id_zanru", "id_hry"
    ); 
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeZanruHryDB = array_intersect_key($udajeZanruHry, array_flip($klice));
  
    if (empty($udajeZanruHry["id_hry"]&&empty($udajeZanruHry["id_zanru"])))
      Db::vloz("zanrhra", $udajeZanruHryDB);
    else  
      Db::zmen("zanrhra", $udajeZanruHryDB, 
               "WHERE id_hry = ? AND id_zanru = ?", array($udajeZanruHry["id_hry"],$udajeZanruHry["id_zanru"]));  
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
  
  public function vratVsechnyZanry() {
    $zanrhra = Db::dotazVsechny("
      SELECT id_zanru,nazev
      FROM zanr
    "); 
    return $zanrhra;
  }  
  public function vratVsechnyHry() {
    $zanrhra = Db::dotazVsechny("
      SELECT id_hry,Jmeno
      FROM hra
    "); 
    return $zanrhra;
  } 
  
  public function vratJmenoHrykZanru(){
        $zanrhra = Db::dotazVsechny("
      SELECT z.nazev,h.Jmeno,h.id_hry,z.id_zanru
      FROM hra h join zanrhra zh on (h.id_hry=zh.id_hry) join zanr z on(zh.id_zanru = z.id_zanru)
    "); 
    return $zanrhra;
  
  }  
  
    public function vratJmenoIdObou($idZanru,$idHry){
        $zanrhra = Db::dotazVsechny("
      SELECT z.nazev,h.Jmeno,h.id_hry,z.id_zanru
      FROM hra h join zanrhra zh on (h.id_hry=zh.id_hry) join zanr z on(zh.id_zanru = z.id_zanru)
      WHERE id_hry = ? AND id_zanru = ?
    ", array($idHry,$idZanru));
    return $zanrhra;
  }  
  
}

?>