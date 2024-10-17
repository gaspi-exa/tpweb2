<?php

require_once 'libs/Smarty.class.php';
require_once 'php/controller/auth.controller.php';

class ArenaView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function render($pokemonsByUser, $userName, $userId)
    {
        $this->smarty->assign('userName', $userName);
        $this->smarty->assign('userId', $userId);
        $this->smarty->assign('pokemonsByUser', $pokemonsByUser);
        $this->smarty->assign('styleFileName', 'arena');
        $this->smarty->display('templates/private/arena.tpl');
    }
}
