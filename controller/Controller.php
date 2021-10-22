<?php

class Controller{

    public function mostrar_index($index)
    {
        require_once "view/".$index.".php";
    }
}

?>