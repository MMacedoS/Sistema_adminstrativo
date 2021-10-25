<?php

class Controller{
    public $dadosUser;
    public $dados;
    public $bicos;

    public function mostrar_index($index)
    {
        require_once "view/".$index.".php";
    }
    public function listarBicos()
    {
        require_once "view/listar/bico.php";
    }
}

?>