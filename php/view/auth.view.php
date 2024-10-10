<?php

require_once 'libs/Smarty.class.php';

class AuthView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function renderAuth($root)
    {
        $this->smarty->assign('root', $root);
        $this->smarty->assign('styleFileName', 'auth');
        $this->smarty->display('templates/auth.tpl');
    }
}
