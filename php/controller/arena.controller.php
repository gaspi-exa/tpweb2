<?php

require_once 'php/view/arena.view.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

class ArenaController
{
    private $pokemonsByUser;
    private $pokemonModel;
    private $view;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonModel = new PokemonModel();
    }

    public function index($userName, $userId)
    {
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
