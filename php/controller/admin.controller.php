<?php

require_once 'php/view/arena.view.php';
require_once 'php/model/relations.model.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

class AdminController
{
    private $allUsers;
    private $allPokemons;
    private $relations;
    private $tableData;

    private $pokemonModel;
    private $relationsModel;
    private $view;

    public function __construct()
    {
        $this->view = new ArenaView();
        $this->pokemonModel = new PokemonModel();
        $this->relationsModel = new RelationsModel();
    }

    public function index($userName, $userId)
    {
        $this->setPokemons($this->pokemonModel->getPokemons());
        $this->setRelations($this->relationsModel->getRelations());
        $this->view->renderAdmin($this->allUsers, $userName, $userId, $this->tableData);
    }

    public function getPokemons()
    {
        return $this->allPokemons;
    }

    public function setPokemons($allPokemons)
    {
        $this->allPokemons = $allPokemons;
    }

    public function setRelations($relations)
    {
        $this->relations = $this->mapRelations($relations);
    }

    public function mapRelations($relations)
    {
        // Procesar los datos para estructurarlos adecuadamente
        $pokemonData = [];

        // Agrupamos Pokémon por usuario
        foreach ($relations as $relation) {
            $relationArray = (array) $relation;
            $pokemonData[$relationArray['name']][] = $relationArray['pokemon_name'];
        }

        // Ahora formateamos los datos para el template
        $this->allUsers = array_keys($pokemonData);
        $maxPokemons = 0;

        // Contamos el máximo de Pokémon por usuario para poder alinear las filas
        foreach ($pokemonData as $userPokemons) {
            $maxPokemons = max($maxPokemons, count($userPokemons));
        }

        // Creamos un arreglo para la tabla
        $this->tableData = [];
        for ($i = 0; $i < $maxPokemons; $i++) {
            $row = [];
            foreach ($this->allUsers as $user) {
                $row[$user] = isset($pokemonData[$user][$i]) ? $pokemonData[$user][$i] : ''; // Asignar Pokémon o vacío
            }
            $this->tableData[] = $row;
        }
    }
}
