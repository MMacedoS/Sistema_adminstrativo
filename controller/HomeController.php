<?php

require_once './model/HomeModel.php';
class HomeController extends Controller{

    
    public function index()
    {   $homeModel= new HomeModel();
        $this->bicos=$homeModel->getAllBicos();
        $this->mostrar_index('home');
    }
}
?>