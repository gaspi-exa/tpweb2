<?php

require_once 'php/model/connection.model.php';

class PokemonModel
{

    private $db;
    private $connection;

    public function __construct()
    {
        $this->connection = new Connection();
        $this->db = $this->connection->getConnection();
    }

    public function getPokemons()
    {
        $query = $this->db->prepare('SELECT pokemon.*, category.name as cat_name FROM pokemon INNER JOIN category ON pokemon.category = category._id');
        // $query = $this->db->prepare('SELECT * FROM pokemon');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    // public function getPokemon($_id = null)
    // {
    //     // $query = $this->db->prepare('SELECT pokemon.*, category.name as cat_name FROM pokemon INNER JOIN category ON pokemon.category = category._id WHERE _id=?');
    //     $query = $this->db->prepare('SELECT * FROM pokemon WHERE _id=?');
    //     $query->execute(array($_id));
    //     return $query->fetch(PDO::FETCH_OBJ);
    // }
}
