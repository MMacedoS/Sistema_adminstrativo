<?php

abstract class Conexao{

    public function __construct(){}

    public function __clone(){}


    public function __destruct(){
        foreach($this as $key=>$value)
        {
            unset($this->$key);
        }
    }

    private static $dbtype   = "mysql";
    private static $host     = "localhost";
    private static $port     = "3306";
    private static $user     = "root";
    private static $password = "";
    private static $db       = "pitstop";

    private function getDBType()  {return self::$dbtype;}
    private function getHost()    {return self::$host;}
    private function getPort()    {return self::$port;}
    private function getUser()    {return self::$user;}
    private function getPassword(){return self::$password;}
    private function getDB()      {return self::$db;}


    public function connect()
    {
        try {
            $this->conexao=new PDO($this->getDBType().":host=".$this->getHost().";port=".$this->getPort().";dbname=".$this->getDB(),$this->getUser(),$this->getPassword());
        } catch (\Throwable $th) {
            //throw $th;

            die("erro: <code>". $i->getMessage()."</code>");
        }

        return ($this->conexao);
        
    }

    public function disconnect(){
        $this->conexao=null;
    }
}