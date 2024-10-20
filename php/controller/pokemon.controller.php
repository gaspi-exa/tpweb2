<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';
require_once 'php/controller/category.controller.php';
require_once 'php/controller/auth.controller.php';

class PokemonController
{
    private $pokemons;
    private $model;
    private $authController;
    private $view;
    private $categories;

    public function __construct()
    {
        $this->model = new PokemonModel();
        $this->authController = new AuthController();
        $this->view = new PokemonView();
        $this->pokemons = $this->getPokemons();
    }

    public function getPokemons()
    {
        $this->setPokemons($this->model->getPokemons(null));
        return $this->pokemons;
    }

    public function setPokemons($pokemons)
    {
        $this->pokemons = $pokemons;
    }

    public function showPokemons()
    {
        $c = new CategoryController();
        $this->categories = $c->getCategories();
        $this->view->renderHome($this->pokemons, $this->categories);
    }

    public function showCategories()
    {
        $c = new CategoryController();
        $this->categories = $c->getCategories();
        $this->view->renderCategories($this->pokemons, $this->categories);
    }

    public function getRandomPokemonID()
    {
        return $this->model->getPokemonByID(rand(1, 151));
    }
}
