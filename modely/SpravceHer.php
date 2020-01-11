<?php
class SpravceHer {
  public function pripravPrazdnePoleHer() {
    return array(
      "id_hry" => "",
      "Jmeno" => "",
      "obsah" => "",
      "datum_vydani" => "",
      "vyvojar" => "",
      "platforma" => ""   
    );
  }

  public function vratVsechnyHry() {
    $hra = Db::dotazVsechny("
      SELECT *
      FROM hra
    ");
    return $hra;
  }
  
  public function vratHru($idHry) {
    return Db::dotazJeden("
      SELECT *
      FROM hra
      WHERE id_hry = ?
    ", array($idHry));
  }
  
  public function ulozHru($udajeHry) {
    $klice = array(
      "id_hry", "Jmeno", "obsah","datum_vydani","vyvojar","platforma"
    ); 
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeHry = array_intersect_key($udajeHry, array_flip($klice));
  
    if (empty($udajeHry["id_hry"]))
      Db::vloz("hra", $udajeHry);
    else  
      Db::zmen("hra", $udajeHry, 
               "WHERE id_hry = ?", array($udajeHry["id_hry"])); 
  }
  
  public function odstranHru($idHry) {
    Db::dotaz("
      DELETE FROM hra
      WHERE id_hry = ?
    ", array($idHry));
  }
  
  public function vratZanryHry($idHry){
    $zanryProHru = Db::dotazVsechny("
      
    SELECT za.nazev,zh.id_hry,za.id_zanru
    FROM
     hra h
     JOIN zanrhra zh ON h.id_hry = zh.id_hry
      JOIN zanr za ON za.id_zanru = zh.id_zanru
    WHERE h.id_hry = ? 
  ", array($idHry));    
  return $zanryProHru;
  }
  
  public function vratIDPosledniHry(){
  return Db::dotazJeden("
  SELECT id_hry 
  FROM hra 
  ORDER BY id_hry DESC LIMIT 1"
  );
  
  
  }
  
    public function priradKIDNazevHry($idHry){
  return Db::dotazJeden("
  SELECT Jmeno 
  FROM hra 
  where id_hry = ?
  ", array($idHry));
  
  
  
  }
  
}

?>