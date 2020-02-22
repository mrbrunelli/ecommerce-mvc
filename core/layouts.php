<?php
require_once __DIR__.'/route.php';


//function getUrl($routes){
   
    $url=parse_url($_SERVER['REQUEST_URI'],PHP_URL_PATH);

    $atual=explode('/',$url);
    $urlAtual=$atual[2];
    
    if($urlAtual){
        foreach($route as $r){

          if($urlAtual==$r[0]){
          // echo $r[1];

          require_once __DIR__."/../controller/".$r[1].".php";

          }
      }
    }else{
      require_once __DIR__."/../controller/".$route[0][1].".php";

    }
    
     
     
      //$pagina=(file_exists("{$pasta}/".$atual[0].'.php') && in_array($atual[0],$permissao)) ? $atual[0]:'erro';
     // $id=intval($atual[1]);
     
     

  
 
//}   

   