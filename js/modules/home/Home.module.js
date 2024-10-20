import Backdrop from "../../components/Backdrop.js";
import PokemonService from "../../services/pokemon.service.js";
import EPokemon from "../../constants/pokemon.js";
import Arena from "../../components/arena/Arena.js";
import Route from "../../constants/route.js"

class HomeModule {
  $pokemonsList = [];
  $root;
  $service;

  constructor(root) {
    this.$root = root;
    this.$service = new PokemonService();
  }

  onInit = () => {
    const btnLogin = document.getElementById("btn-login");
    const btnSignup = document.getElementById("btn-signup");

    btnLogin.onclick = () => {
      window.open(Route.LOGIN, "_self");
    };
    btnSignup.onclick = () => {
      window.open(Route.SIGNUP, "_self");
    };

    // const arena = new Arena(this.$pokemonsList);
    // this.$root.appendChild(arena.getArena());

    return;
    this.$service.getPokemons().then((next) => {
      this.setPokemonsList(next);
      if (this.$pokemonsList?.length > 0) {
        const backdrop = new Backdrop();
        const pokemon = this.$pokemonsList.find(
          (pok) => pok.name === EPokemon.GENGAR
        );
        backdrop.setImage(pokemon?.url);

        const arena = new Arena(this.$pokemonsList);
        // this.$root.appendChild(arena.getArena());
        this.$root.appendChild(arena.getArena());
      }
    });
  };

  setPokemonsList = (next) => {
    this.$pokemonsList = next;
  };
}

export default HomeModule;
