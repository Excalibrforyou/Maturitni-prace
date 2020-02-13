<?php
class SpravceHodnoceni {
  public function pripravPrazdnePoleHodnoceni() {
    return array(
      "id_hod" => "",
      "hodnoceni" => "",
      "komentar" => "",
      "id_uzivatele" => "",
      "id_hry" => ""    
    );
  }

  public function vratHodnoceni() {
    $hodnoceni = Db::dotazVsechny("
      SELECT *
      FROM hodnoceni
    ");
    return $hodnoceni;
  }
  
  public function vratHodnot($idHodnoceni) {
    return Db::dotazJeden("
      SELECT *
      FROM hodnoceni
      WHERE id_hod = ?
    ", array($idHodnoceni));
  }
  
  public function ulozHodnoceni($udajeHodnoceni) {
    $klice = array(
      "id_hod", "hodnoceni", "komentar","id_uzivatele","id_hry"
    ); 
       // array_flip ... prohodí klíče a hodnoty v poli
       // array_intersect_key ... ponechá v prvním poli pouze prvky s klíči z druhého pole
    $udajeHodnoceni = array_intersect_key($udajeHodnoceni, array_flip($klice));
  
    if (empty($udajeHodnoceni["id_hod"]))
      Db::vloz("hodnoceni", $udajeHodnoceni);
    else  
      Db::zmen("hodnoceni", $udajeHodnoceni, 
               "WHERE id_hod = ?", array($udajeHodnoceni["id_hod"])); 
  }
  
  public function odstranHodnoceni($idHodnoceni) {
    Db::dotaz("
      DELETE FROM hodnoceni
      WHERE id_hod = ?
    ", array($idHodnoceni));
  }
  
    public function vratVsechnyHodnoceniUzivatele($idUzivatele) {
    return Db::dotazVsechny("
      SELECT *
      FROM hodnoceni
      WHERE id_uzivatele = ?
    ", array($idUzivatele));
  }
    public function vratVsechnyHodnoceniHry($idHry) {
    return Db::dotazVsechny("
      SELECT u.prezdivka, ho.hodnoceni,ho.komentar,hr.Jmeno
      FROM hodnoceni ho join hra hr on(ho.id_hry=hr.id_hry) join uzivatel u on(ho.id_uzivatele=u.ID_uzivatele)
      WHERE ho.id_hry = ?
    ", array($idHry));
  }
                     
  public function vratCelkoveHodnoceni($idHry){
     return Db::dotazSamotny("
     select TRUNCATE(AVG(hodnoceni),0)
     from hodnoceni
     WHERE id_hry = ?
    ", array($idHry));
  
  }
  
}
?>