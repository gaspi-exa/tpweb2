<?php

require_once 'php/API/controller/API.pokemon.controller.php';
require_once 'php/API/controller/API.user.controller.php';
require_once 'RouterClass.php';

$r = new Router();

//$r->addRoute('comments/:ID', 'GET', 'APICommentController', 'getCommentsByTicketID');
//$r->addRoute('post-comment', 'POST', 'APICommentController', 'postComment');
//$r->addRoute('delete-comment/:ID', 'DELETE', 'APICommentController', 'deleteComment');

/* POKEMON */
$r->addRoute('addPokemon', 'POST', 'APIPokemonController', 'addPokemonByUser');
$r->addRoute('getRandomPokemon', 'GET', 'APIPokemonController', 'getRandomPokemon');
$r->addRoute('getPokemonTeam/:ID', 'GET', 'APIPokemonController', 'getPokemonTeam');
    
/* USER */
$r->addRoute('getUser', 'GET', 'APIUserController', 'getUser');

$r->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
