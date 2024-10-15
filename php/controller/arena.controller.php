<?php

require_once 'php/view/arena.view.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

class ArenaController
{
    private $pokemonsByUser;
    private $pokemonController;
    private $view;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonController = new PokemonController();
    }

    public function index($userName, $userId)
    {
        $this->setPokemons($this->pokemonController->showPokemonsSession($userId));
        $this->view->render($this->pokemonsByUser, $userName);
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
