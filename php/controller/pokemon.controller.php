<?php

require_once 'php/model/pokemon.model.php';
require_once 'php/view/pokemon.view.php';

class PokemonController
{
    private $pokemons;
    private $model;
    private $view;

    public function __construct()
    {
        $this->model = new PokemonModel();
        $this->view = new PokemonView();
        $this->pokemons = $this->getPokemons();
        $this->showPokemons();
    }
    public function getPokemons($params = null)
    {
        if ($params == null) {
            $this->setPokemons($this->model->getPokemons(null));
        } else {
            $this->setPokemons($this->model->getPokemon($params[':ID']));
        }
        return $this->pokemons;
    }
    
    public function setPokemons($pokemons)
    {
        $this->pokemons = $pokemons;
    }


    public function showPokemons()
    {
        $this->view->showPokemons($this->pokemons);
    }
}
