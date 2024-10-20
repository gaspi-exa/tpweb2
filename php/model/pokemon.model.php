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
        // $query = $this->db->prepare('SELECT pokemon.*, category.name as cat_name FROM pokemon INNER JOIN category ON pokemon.category = category._id');
        $query = $this->db->prepare('SELECT * FROM pokemon');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getPokemonsSession($user_id)
    {
        $query = $this->db->prepare('SELECT p._id, p.name 
            FROM pokemon p
            JOIN user_pokemon up ON p._id = up.pokemon_id
            WHERE up.user_id = ?;');
        $query->execute([$user_id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getPokemonByID($id = null)
    {
        // $query = $this->db->prepare('SELECT pokemon.*, category.name as cat_name FROM pokemon INNER JOIN category ON pokemon.category = category._id WHERE _id=?');
        $query = $this->db->prepare('SELECT * FROM pokemon WHERE _id=?');
        $query->execute(array($id));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function addPokemon($user_id, $pokemon_id)
    {
        $query = $this->db->prepare('INSERT INTO user_pokemon(user_id, pokemon_id) VALUES(?, ?)');
        $query->execute(array($user_id, $pokemon_id));
        return $this->db->lastInsertId();
    }

    function deletePokemon($pokemon_id, $user_id)
    {
        $query = $this->db->prepare('DELETE FROM user_pokemon WHERE user_id = ? AND pokemon_id = ?');
        $query->execute(array($user_id, $pokemon_id));
        return $this->db->lastInsertId();
    }
}
