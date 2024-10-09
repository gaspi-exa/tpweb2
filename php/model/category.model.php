<?php

require_once 'php/model/connection.model.php';

class CategoryModel
{

    private $db;
    private $connection;

    public function __construct()
    {
        $this->connection = new Connection();
        $this->db = $this->connection->getConnection();
    }

    public function getCategories()
    {
        $query = $this->db->prepare('SELECT * FROM category');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
