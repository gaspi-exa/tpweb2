<?php

require_once 'php/model/connection.model.php';

class RelationsModel
{

    private $db;
    private $connection;

    public function __construct()
    {
        $this->connection = new Connection();
        $this->db = $this->connection->getConnection();
    }

    public function getRelations()
    {
        $query = $this->db->prepare('SELECT u.name, p.name AS pokemon_name 
                          FROM user_pokemon up 
                          JOIN user u ON up.user_id = u._id 
                          JOIN pokemon p ON up.pokemon_id = p._id 
                          ORDER BY u.name;');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
