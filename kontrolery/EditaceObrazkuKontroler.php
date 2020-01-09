<?php
class EditaceObrazkuKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceObrazku = new SpravceObrazku();
    
    if (!empty($_POST)) {
      $spravceObrazku->ulozObrazek($_POST);
      $this->presmeruj("obrazek");
    }
    
    if (!empty($parametry[0]))
    {
      $obrazek = $spravceObrazku->vratObrazek($parametry[0]);
    }
    else
      $obrazek = $spravceObrazku->pripravPrazdnePoleObrazku();
    
    $this->data["obrazek"] = $obrazek;
    $this->pohled = "editaceObrazku";
  }
}
?>