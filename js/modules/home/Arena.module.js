import PokemonService from "../../services/pokemon.service.js";
import UserService from "../../services/user.service.js";

class ArenaModule {
  $pokemonsList = [];
  $service;
  $root;

  constructor(root) {
    this.$root = root;
    this._pokemonService = new PokemonService();
    this._userService = new UserService();
  }

  onInit = () => {
    this.getRandomPokemon();
    this.getUser();

    const btnPower = document.getElementById("btn-power");
    const btnPokeball = document.getElementById("send");
    const btnUpdate = document.getElementById("btn-update");

    btnPower.onclick = () => {
      window.open(Route.LOGOUT, "_self");
    };
    btnPokeball.onclick = () => {
      this._pokemonService.addPokemon(this.$user._id, this.randomPokemon._id);
    };
    btnUpdate.onclick = () => {
      this.getRandomPokemon();
    };
  };

  getRandomPokemon = () => {
    const pokeContainer = document.querySelector(".poke-container");
    pokeContainer.innerHTML = "";

    const loading = document.createElement("img");
    pokeContainer.appendChild(loading);
    loading.setAttribute("src", "js/assets/img/loading.gif");
    loading.setAttribute("style", "width: 50px; height: 50px;");

    this._pokemonService
      .getRandomPokemon()
      .then((pokemon) => {
        pokeContainer.innerHTML = "";
        this.randomPokemon = pokemon;
        const img = document.createElement("img");
        pokeContainer.appendChild(img);
        if (img) {
          img.setAttribute(
            "src",
            `https://play.pokemonshowdown.com/sprites/xyani/${this.randomPokemon.name}.gif`
          );
        }
      })
      .catch((error) => {
        console.error(error);
      });
  };

  getUser = () => {
    this._userService
      .getUser()
      .then((user) => {
        this.$user = user;
        console.log(user);
      })
      .catch((error) => {
        console.error(error);
      });
  };
}

export default ArenaModule;
