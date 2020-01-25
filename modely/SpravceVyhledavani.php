<?php
class SpravceVyhledavani {

  public function hledej($hledanaHodnota) {

    $vysledek = Db::likeDotaz("      
      select *
      from hra
      where Jmeno like :klicoveSlovo
    ", array($hledanaHodnota)); 
    return $vysledek;
  }
     
}
?>