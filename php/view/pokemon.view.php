<?php

class PokemonView
{
    public function __construct () {
        $this->smarty=new Smarty();


    }
    public function renderHome ($pokemons)
    {   

        $this->smarty->assign("pokemons", $pokemons);
        
        $this->smarty->display("templates/index.tpl");


    }
}
