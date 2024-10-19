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
    this.userId = document.getElementById("user-id").innerHTML;

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

  addPokemon = async () => {
    const pokeUserContainer = document.querySelector(".list-container");
    const response = await this._pokemonService.addPokemon(this.userId, this.$randomPokemon._id);
    pokeUserContainer.innerHTML = "";
    response.forEach((poke) => {
      const listItem = document.createElement("div");
      listItem.classList.add("list-item");
      const pokeItem = document.createElement("div");
      pokeItem.classList.add("poke-item");
      const img = document.createElement("img");
      img.setAttribute(
        "src",
        `https://play.pokemonshowdown.com/sprites/xyani/${poke.name}.gif`
      );
      img.setAttribute("alt", poke.name);
      pokeItem.appendChild(img);
      const pokeName = document.createElement("h1");
      pokeName.textContent = poke.name;
      listItem.appendChild(pokeItem);
      listItem.appendChild(pokeName);
      pokeUserContainer.appendChild(listItem);
    });



  }




}


export default ArenaModule;
