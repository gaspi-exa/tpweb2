<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';
require_once 'php/controller/category.controller.php';

class ArenaController
{
    private $userName;
    private $pokemonsByUser;
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
        $this->view->render($this->pokemonsByUser);
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
