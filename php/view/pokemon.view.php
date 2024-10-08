<?php

class PokemonView
{
    public function showPokemons($pokemons)
    {
        echo '<h1>Pokemons</h1>';
        foreach ($pokemons as $pokemon) {
            echo $pokemon->_id . '<br>';
        }
    }
}
