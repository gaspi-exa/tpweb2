<?php

require_once 'libs/Smarty.class.php';
require_once 'controller/auth.controller.php';

class ArenaView
{
    private $smarty;
    private $userName;

    public function __construct()
    {
        $this->smarty = new Smarty();
        $authController = new AuthController();
        $this->userName = $authController->getUserName();
    }

    public function render($pokemonsByUser)
    {
        $this->smarty->assign('userName', $this->userName);
        $this->smarty->assign('pokemonsByUser', $pokemonsByUser);
        $this->smarty->assign('styleFileName', 'arena');
        $this->smarty->display('templates/private/arena.tpl');
    }
}
