<?php
    require_once 'autoload.php';
    define('ROTA_GERAL',"http://$_SERVER[HTTP_HOST]".'/sistema_financeiro');
    define('PATH_GERAL',__DIR__);
    $rota=new Rota();

?>