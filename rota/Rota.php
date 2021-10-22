<?php

class Rota{
    public function __construct()
    {
        $this->run();
    }

    public function run()    
    {
        $parametro=[];
        if(isset($_GET['pag']))
        {
            $url=$_GET['pag'];
            // echo "<script>window.alert('".$url."');</script>";
        }
        if(!empty($url))
        {
            $url=explode('/',$url);
            $controller=$url[0]."Controller";
            array_shift($url);

            if(!empty($url) && isset($url[0]))
            {
                $metodo=$url[0];
                array_shift($url);

            }else
            {
                $metodo="index";
            }
            if(count($url)>0)
            {
             $parametro=$url;   
            }
        }else
        {
            $controller="HomeController";
            $metodo="index";
        }

        $caminho="Sistema_Financeiro/controller/".$controller.".php";

        if(!file_exists($caminho) && !method_exists($controller,$metodo))
        {
            $controller="HomeController";
            $metodo="index";
        }
        $control=new $controller;
        call_user_func_array(array($control,$metodo),$parametro);        
    }
}

?>