<?php

require_once 'RouterClass.php';
require_once 'php/controller/pokemon.controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$r = new Router();

$r->addRoute('*', 'GET', 'PokemonController', 'getPokemons');

$r->setDefaultRoute('PokemonController', 'getPokemons');

$r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);
