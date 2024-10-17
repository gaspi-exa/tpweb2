<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/api/view/API.view.php';
require_once 'php/api/controller/API.controller.php';
require_once 'php/controller/pokemon.controller.php';

class APIPokemonController extends APIController
{

    private $model;
    private $view;
    private $pokemonController;

    function __construct()
    {
        parent::__construct();
        $this->model = new PokemonModel();
        $this->view = new APIView();
        $this->pokemonController = new PokemonController();
    }

    public function getRandomPokemon()
    {
        $this->view->response($this->pokemonController->getRandomPokemonID(), 200);
    }
    // public function addPokemon($userId, $pokemonId)
    // {
    //     try {
    //         // Prepara la consulta SQL
    //         $query = 'INSERT INTO user_pokemon (user_id, pokemon_id) VALUES (:user_id, :pokemon_id)';
    //         $stmt = $this->db->prepare($query);

    //         // Vincula los parámetros
    //         $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
    //         $stmt->bindParam(':pokemon_id', $pokemonId, PDO::PARAM_INT);

    //         // Ejecuta la consulta
    //         return $stmt->execute();
    //     } catch (PDOException $e) {
    //         // Manejo de errores
    //         echo "Error: " . $e->getMessage();
    //         return false;
    //     }
    // }
}
