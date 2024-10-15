<?php

require_once 'php/view/arena.view.php';
require_once 'php/controller/pokemon.controller.php';

class ArenaController
{
    private $pokemonsByUser;
    private $pokemonController;
    private $view;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonController = new PokemonController();
        $this->setPokemons($this->pokemonController->getPokemons());
    }

    public function index($userName)
    {
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
