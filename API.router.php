<?php

require_once 'php/API/controller/API.pokemon.controller.php';
require_once 'php/API/controller/API.user.controller.php';
require_once 'RouterClass.php';

$r = new Router();

/* POKEMON */
$r->addRoute('getPokemon/:ID', 'GET', 'APIPokemonController', 'getPokemon');
$r->addRoute('addPokemon', 'POST', 'APIPokemonController', 'addPokemonByUser');
$r->addRoute('getRandomPokemon', 'GET', 'APIPokemonController', 'getRandomPokemon');
$r->addRoute('getPokemonTeam/:ID', 'GET', 'APIPokemonController', 'getPokemonTeam');
$r->addRoute('deletePokemon/:pokemon_id/:user_id', 'DELETE', 'APIPokemonController', 'deletePokemon');
$r->addRoute('updateRarity/:ID', 'PUT', 'APIPokemonController', 'updateRarity');

/* USER */
$r->addRoute('getUser', 'GET', 'APIUserController', 'getUser');

$r->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
