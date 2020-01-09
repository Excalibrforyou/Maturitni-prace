<?php
class EditaceObrazkuKontroler extends Kontroler {
  public function zpracuj($parametry) {
    $spravceObrazku = new SpravceObrazku();

    if (!empty($_POST)) {
       $spravceObrazku->upload($_FILES,$_POST["id_hry"]);
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