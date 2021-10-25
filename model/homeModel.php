<?php

class HomeModel extends Conexao{

    public function conexao()
    {
      
        return $this->connect();

        
    }


    public function getAllBicos()
    {
        $con=$this->conexao();
        $cmd=$con->query("SELECT * FROM Bico");

        $dados=$cmd->fetchAll(PDO::FETCH_ASSOC);
        return $dados;
    }

}

?>