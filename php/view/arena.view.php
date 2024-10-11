<?php

require_once 'libs/Smarty.class.php';

class ArenaView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function render($pokemons)
    {
        $this->smarty->assign('pokemons', $pokemons);
        $this->smarty->assign('styleFileName', 'arena');
        $this->smarty->display('templates/private/arena.tpl');
    }
}
