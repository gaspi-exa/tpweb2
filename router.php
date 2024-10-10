<?php

require_once 'RouterClass.php';
require_once 'php/controller/pokemon.controller.php';
require_once 'php/controller/auth.controller.php';

define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

$r = new Router();

$r->addRoute('*', 'GET', 'PokemonController', 'showPokemons');

/* AUTH */
$r->addRoute('login', 'POST', 'AuthController', 'createUser');
$r->addRoute('login', 'GET', 'AuthController', 'showLogin');
$r->addRoute('home', 'POST', 'AuthController', 'verifyUser');

$r->addRoute('signup', 'GET', 'AuthController', 'showSignup');
$r->addRoute('logout', 'GET', 'AuthController', 'showLogout');
$r->addRoute('logout', 'POST', 'AuthController', 'logout');

$r->setDefaultRoute('PokemonController', 'showPokemons');

$r->route($_GET['action'], $_SERVER['REQUEST_METHOD']);
