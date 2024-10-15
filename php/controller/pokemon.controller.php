<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';
require_once 'php/controller/category.controller.php';

class PokemonController
{
    private $pokemons;
    private $model;
    private $view;
    private $categories;

    public function __construct()
    {
        $this->model = new PokemonModel();
        $this->view = new PokemonView();
        $this->pokemons = $this->getPokemons();
        // $this->showPokemons();
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

    public function showPokemonsSession($userName = null)
    {
        $c = new CategoryController();
        $this->categories = $c->getCategories();
        $this->view->renderHomeSession($this->pokemons, $this->categories, $userName);
    }
}
