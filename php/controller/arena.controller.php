<?php

require_once 'php/view/arena.view.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';
require_once 'php/helpers/auth.helper.php';

class ArenaController
{
    private $pokemonsByUser;
    private $pokemonModel;
    private $view;
    private $authHelper;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonModel = new PokemonModel();
        $this->authHelper = new AuthHelper();
    }

    public function index($userName, $userId)
    {
        // session_start();
        // if ($this->authHelper->checkLoggedIn()) {
        //     $userId = $_SESSION['USER_ID'];
        //     $userName = $_SESSION['NAME'];
        // }
        $this->setPokemons($this->pokemonModel->getPokemonsSession($userId));
        $this->view->render($this->pokemonsByUser, $userName, $userId);
    }

    public function getPokemons()
    {
        return $this->pokemonsByUser;
    }

    public function setPokemons($pokemonsByUser)
    {
        $this->pokemonsByUser = $pokemonsByUser;
    }
}
