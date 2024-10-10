<?php

require_once 'libs/Smarty.class.php';

class LoginView
{        
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function renderHome($pokemons, $categories)
    {
        $this->$smarty->display('login.tpl');
    }
}
