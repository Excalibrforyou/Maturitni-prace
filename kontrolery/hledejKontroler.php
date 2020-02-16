<?php
class HledejKontroler extends Kontroler {
  public function zpracuj($parametry) {
  
  
  
    $spravceVyhledavani = new SpravceVyhledavani();
    $spravceHer = new SpravceHer(); 
    $spravceZanru = new SpravceZanru();
    $zanryProDaneHry= array();  
    $zanry = $spravceZanru->vratVsechnyZanry();
    
    
    
         
    if(isset($_POST["vyhledavani"])){
    if(preg_match("/^[a-zA-Z0-9]+$/", $_POST["vyhledavani"])){
    $vysledky = $spravceVyhledavani->hledej($_POST["vyhledavani"]);
    $_SESSION["vysledkyVyhledavani"] = $vysledky;
    
    }      
    else $this->presmeruj("uvod");
    
    } 
   /* else $this->presmeruj("uvod");  */

    $hry = $spravceHer->vratVsechnyHry();  
                                   
                                
    if(empty($_POST["zanr"])){
    
   foreach($_SESSION["vysledkyVyhledavani"] as $hra){
     $zanryProDaneHry = array_merge($zanryProDaneHry,$spravceHer->vratZanryHry($hra["id_hry"]));
     $finalHry[$hra["id_hry"]] = $hra["id_hry"];

   }  
   }
   
   if (!empty($_POST["zanr"])){

            $pomocnik = "";
            $i = 0;
            foreach ($_POST["zanr"] as $k) {
                
                if ($i == 0) {
                    $pomocnik = $pomocnik . $k;
                } else {
                    $pomocnik = $pomocnik . "," . $k;
                    
                }
                $i++;
                
            }
            
            
            
            foreach ($_SESSION["vysledkyVyhledavani"] as $hra) {
                
                $zanryProDaneHry = array_merge($zanryProDaneHry, $spravceHer->vratZanryHry($hra["id_hry"]));
                
                $pomoc[$hra["id_hry"]] = $spravceHer->vratZanryHry($hra["id_hry"]);
                
                $i = 0;
                
                $zanr[$hra["id_hry"]] = "";
                
                foreach ($pomoc[$hra["id_hry"]] as $h) {
                    
                    
                    
                    if ($i == 0) {
                        $zanr[$hra["id_hry"]] = $zanr[$hra["id_hry"]] . $h["id_zanru"];
                    } else {
                        $zanr[$hra["id_hry"]] = $zanr[$hra["id_hry"]] . "," . $h["id_zanru"];
                        
                    }
                    $i++;
                    
                    
                    
                    
                }
                
                $data[$hra["id_hry"]] = explode(",", $zanr[$hra["id_hry"]]);
                $pocet = count($_POST["zanr"]);
                $OK = 0;
                
                foreach ($data[$hra["id_hry"]] as $c) {
                    if (in_array($c, $_POST["zanr"])) {
                        
                        $OK++;
                    }
                    
                    if ($OK == $pocet) {
                       $finalHry[$hra["id_hry"]] = $hra["id_hry"];
                    }
                    
                    
                }
                
                
                
            }
             
        }

           
    $this->data["finalHry"]     = $finalHry;
    $this->data["vsechnyZanry"] = $zanry;
    $this->data["zanry"] = $zanryProDaneHry;
    $this->pohled = "vyhledavani";
  }
}
?>