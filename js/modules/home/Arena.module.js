import PokemonService from "../../services/pokemon.service.js";
import UserService from "../../services/user.service.js";
import Route from "../../constants/route.js";

class ArenaModule {
  $pokemonsList = [];
  $service;
  $root;
  $randomPokemon;
  $userId;

  constructor(root) {
    this.$root = root;
    this._pokemonService = new PokemonService();
    this._userService = new UserService();
  }

  onInit = () => {
    this.getRandomPokemon();
    const btnPower = document.getElementById("btn-power");
    const btnPokeball = document.getElementById("send");
    const btnUpdate = document.getElementById("btn-update");
    this.$userId = Number(document.getElementById("user-id").innerHTML);

    btnPower.onclick = () => {
      window.open(Route.LOGOUT, "_self");
    };
    btnPokeball.onclick = () => {
      this.addPokemon();
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
        this.$randomPokemon = pokemon;
        const img = document.createElement("img");
        pokeContainer.appendChild(img);
        if (img) {
          img.setAttribute(
            "src",
            `https://play.pokemonshowdown.com/sprites/xyani/${this.$randomPokemon.name}.gif`
          );
        }
      })
      .catch((error) => {
        console.error(error);
      });
  };

  addPokemon = () => {
    console.log(this.$userId);
    console.log(this.$randomPokemon._id);
    const promise = this._pokemonService.addPokemon(
      this.$userId,
      this.$randomPokemon._id
    );
    promise.then((response) => {
      if (response) {
        
      }
    });
  };
}

export default ArenaModule;
