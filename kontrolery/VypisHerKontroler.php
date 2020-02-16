<?php
class VypisHerKontroler extends Kontroler
{
    public function zpracuj($parametry)
    {
        
        $spravceHer         = new SpravceHer();
        $spravceVyhledavani = new SpravceVyhledavani();
        $zanryProDaneHry    = array();
        $spravceZanru       = new SpravceZanru();
        $spravceZanrHra     = new SpravceZanrHra();
        $zanry              = $spravceZanru->vratVsechnyZanry();
        $zanr               = array();
        $hry                = $spravceHer->vratVsechnyHry();
         
        
        
        
        if (empty($_POST["zanr"])) {
            
            
            
            foreach ($hry as $hra) {
                 $zanryProDaneHry = array_merge($zanryProDaneHry, $spravceHer->vratZanryHry($hra["id_hry"]));
                 $finalHry[$hra["id_hry"]] = $hra["id_hry"];
            }
            
            
        }
        
        
        
        
        
        
        
        if (!empty($_POST["zanr"])) {
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
            
            
            
            foreach ($hry as $hra) {
                
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
        $this->data["zanry"]        = $zanryProDaneHry;
        $this->data["hry"]          = $hry;
        $this->pohled               = "vypisHer";
    }
}
?>