<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';
require_once 'php/controller/category.controller.php';

class ArenaController
{
    private $pokemons;
    private $pokemonController;
    private $view;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonController = new PokemonController();
        $this->setPokemons($this->pokemonController->getPokemons());
    }

    public function index()
    {
        $this->view->render($this->pokemons);
    }

    public function getPokemons()
    {
        return $this->pokemons;
    }

    public function setPokemons($pokemons)
    {
        $this->pokemons = $pokemons;
    }
}
