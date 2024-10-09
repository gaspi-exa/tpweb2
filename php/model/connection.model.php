<?php

class Connection
{

    private $db;

    public function __construct()
    {
        $host = 'host=localhost;';
        $dbname = 'dbname=tpweb2;charset=utf8';
        $user = 'root';
        $password = ''; // '123456'
        try {
            $pdo = new PDO('mysql:' . $host . $dbname, $user, $password);
            // echo 'Successful connection.';
            $this->db = $pdo;
        } catch (PDOException $exc) {
            echo 'Connection error: ' . $exc->getMessage();
        }
    }


    public function getConnection()
    {
        return $this->db;
    }
}
