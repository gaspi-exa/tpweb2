<?php

//require_once 'php/API/controller/API.comment.controller.php';
require_once 'php/API/controller/API.pokemon.controller.php';
require_once 'RouterClass.php';

$r = new Router();

//$r->addRoute('comments/:ID', 'GET', 'APICommentController', 'getCommentsByTicketID');
//$r->addRoute('post-comment', 'POST', 'APICommentController', 'postComment');
//$r->addRoute('delete-comment/:ID', 'DELETE', 'APICommentController', 'deleteComment');

$r->addRoute('add-pokemon/:ID', 'POST', 'APIPokemonController', 'addPokemon');
$r->addRoute('getRandomPokemon', 'GET', 'APIPokemonController', 'getRandomPokemon');
$r->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);
