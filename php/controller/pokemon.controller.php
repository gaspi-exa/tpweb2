<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';
require_once 'php/controller/category.controller.php';
require_once 'php/controller/auth.controller.php';

class PokemonController
{
    private $pokemons;
    private $model;
    private $view;
    private $categories;
    private $rarities;

    public function __construct()
    {
        $this->model = new PokemonModel();
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
        $this->rarities = $this->model->getRarities();
        $this->view->renderCategories($this->pokemons, $this->categories, $this->rarities);
    }

    public function showCategoriesAdmin()
    {
        $c = new CategoryController();
        $this->categories = $c->getCategories();
        $this->rarities = $this->model->getRarities();
        $this->view->renderCategoriesAdmin($this->pokemons, $this->categories, $this->rarities);
    }

    public function getRandomPokemonID()
    {
        return $this->model->getPokemonByID(rand(1, 151));
    }
}
