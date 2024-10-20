<?php

require_once 'libs/Smarty.class.php';

class PokemonView
{
    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function renderHome($pokemons, $categories)
    {
        $this->smarty->assign('pokemons', $pokemons);
        $this->smarty->assign('categories', $categories);
        $this->smarty->assign('styleFileName', 'home');
        $this->smarty->display('templates/public/index.tpl');
    }

    public function renderCategories($pokemons, $categories, $rarities)
    {
        $this->smarty->assign('pokemons', $pokemons);
        $this->smarty->assign('categories', $categories);
        $this->smarty->assign('rarities', $rarities);
        $this->smarty->assign('styleFileName', 'categories');
        $this->smarty->display('templates/private/admin/category.tpl');
    }
}
