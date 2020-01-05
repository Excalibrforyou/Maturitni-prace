<?php
class SmerovacKontroler extends Kontroler {
  // objekt kontroleru, kterému bylo předáno řízení
  protected $kontroler; 
  
  public function zpracuj($parametry) {
    // získat obsah URL za doménou (cestu) *** OK
    $castiCesty = $this->parsujURL($parametry[0]);
    
    if (empty($castiCesty[0])) {
      // přesměrovat na výchozí kontroler
      $this->presmeruj("uvod");
    }
    
    // TODO : upravit 1. část (kontroler) z pomlček na CamelCase
      // editace-uzivatele  -> EditaceUzivateleKontroler
    $nazevKontroleru = $this->pomlckyNaVelbloudiNotaci(array_shift($castiCesty)) . "Kontroler";
    
    // pokud takový kontroler existuje,
       // vytvořit objekt a předat mu řízení  
    if (file_exists("kontrolery/$nazevKontroleru.php"))
    {
      $this->kontroler = new $nazevKontroleru();
    }
    else {
      // přesměrovat na chybovou stránku (chybový kontroler)
      $this->presmeruj("chyba");
    }
    
    // "předání řízení" konkrétnímu kontroleru
    $this->kontroler->zpracuj($castiCesty);
    
    $spravceUzivatelu = new SpravceUzivatelu();
    $this->data["prihlasenyUzivatel"] =
       $spravceUzivatelu->vratUdajePrihlasenehoUzivatele();
    $this->pohled = "rozlozeni";    
    
  }
  
  private function parsujURL($url) {
    $rozdelenaURL = parse_url($url); // rozdělí do pole částí URL
    $cesta = $rozdelenaURL["path"]; // cesta (za doménou)
    
    $cesta = ltrim($cesta, "/"); // odebere počáteční /
    $cesta = trim($cesta); // očistíme o mezery před a za
    
    $rozdelenaCesta = explode("/", $cesta);
    
    return $rozdelenaCesta;
  }
  
  private function pomlckyNaVelbloudiNotaci($text) {
    $text = str_replace("-", " ", $text);
    $text = ucwords($text);
    $text = str_replace(" ", "", $text);
    return $text;
  }
}
?>