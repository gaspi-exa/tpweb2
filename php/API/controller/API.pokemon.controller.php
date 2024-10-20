<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/api/view/API.view.php';
require_once 'php/api/controller/API.controller.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/helpers/auth.helper.php';

class APIPokemonController extends APIController
{

    private $model;
    private $view;
    private $pokemonController;
    private $authHelper;

    function __construct()
    {
        parent::__construct();
        $this->model = new PokemonModel();
        $this->view = new APIView();
        $this->pokemonController = new PokemonController();
        $this->authHelper = new AuthHelper();
    }

    public function getRandomPokemon()
    {
        $this->view->response($this->pokemonController->getRandomPokemonID(), 200);
    }

    public function addPokemonByUser()
    {
        $pokemon = $this->getData();
        $response = $this->model->addPokemon(
            $pokemon->user_id,
            $pokemon->pokemon_id
        );
        $this->view->response($response, 200);
    }

    public function deletePokemon($params = null)
    {
        $pokemon_id = $params[':pokemon_id'];
        $user_id = $params[':user_id'];
        $response = $this->model->deletePokemon($pokemon_id, $user_id);
        $this->view->response($response, 200);
    }

    public function getPokemonTeam($params = null)
    {
        $user_id = $params[':ID'];
        $response = $this->model->getPokemonsSession($user_id);
        $this->view->response($response, 200);
    }

    public function getPokemon($params = null)
    {
        $name = $params[':ID'];
        $response = $this->model->getPokemonByName($name);
        $this->view->response($response, 200);
    }

    public function updateRarity($params = null)
    {
        $pokemon_id = $params[':ID'];
        $body = $this->getData();
        $response = $this->model->updateRarity($pokemon_id, $body->rarity);
        $this->view->response($response, 200);
    }
}
