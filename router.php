<?php

require_once 'RouterClass.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$r = new Router();

$r->addRoute('*', 'GET', 'PokemonController', 'getPokemons');
// public function addRoute($url, $verb, $controller, $method)
$r->addRoute('*', 'GET', 'AuthController', 'showLogin');

$r->setDefaultRoute('PokemonController', 'getPokemons');

$r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);
