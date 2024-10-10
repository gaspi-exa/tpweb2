<?php

require_once 'RouterClass.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$r = new Router();

$r->addRoute('*', 'GET', 'PokemonController', 'getPokemons');

/* AUTH */
$r->addRoute('login', 'GET', 'AuthController', 'showLogin');
$r->addRoute('signup', 'GET', 'AuthController', 'showSignup');
$r->addRoute('logout', 'GET', 'AuthController', 'showLogout');

$r->setDefaultRoute('PokemonController', 'getPokemons');

$r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);
