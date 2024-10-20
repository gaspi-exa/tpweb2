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
    const btnsDelete = document.querySelectorAll(".btn-delete");
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

    if (btnsDelete.length > 0) {
      btnsDelete.forEach((btn) => {
        btn.onclick = () => {
          this.deletePokemon(btn.dataset.id);
        };
      });
    }
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
    const promise = this._pokemonService.addPokemon(
      this.$userId,
      this.$randomPokemon._id
    );
    promise.then((response) => {
      if (response) {
        this._pokemonService
          .getPokemonsByUser(this.$userId)
          .then((pokemons) => {
            this.renderPokemonsList(pokemons);
            this.getRandomPokemon();
          });
      }
    });
  };

  renderPokemonsList = (pokemons) => {
    const pokeUserContainer = document.querySelector(".list-container");
    pokeUserContainer.innerHTML = "";
    if (pokemons && pokemons.length >= 0) {
      pokemons.forEach((poke) => {
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
        const btnDelete = document.createElement("button");
        btnDelete.classList.add("btn-delete");
        btnDelete.setAttribute("data-id", poke._id);
        btnDelete.textContent = "F";
        btnDelete.onclick = () => {
          this.deletePokemon(poke._id);
        };
        listItem.appendChild(pokeItem);
        listItem.appendChild(pokeName);
        listItem.appendChild(btnDelete);
        pokeUserContainer.appendChild(listItem);
      });
    }
  };

  deletePokemon = (pokemon_id) => {
    const promise = this._pokemonService.deletePokemon(
      pokemon_id,
      this.$userId
    );
    promise.then((response) => {
      if (response) {
        this._pokemonService
          .getPokemonsByUser(this.$userId)
          .then((pokemons) => {
            this.renderPokemonsList(pokemons);
          });
      }
    });
  };
}

export default ArenaModule;
