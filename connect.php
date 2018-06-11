<?php

class DB
{

    private $user = "plava";
    private $password = "plavat1";
    private $database = "jelovnik";
    private $host = "localhost";


    function connect()
    {
        $con = new mysqli ($this->host, $this->user, $this->password, $this->database);
        $con->set_charset("utf8");
        return $con;
    }
}