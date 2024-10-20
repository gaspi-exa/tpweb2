import Backdrop from "../../components/Backdrop.js";
import PokemonService from "../../services/pokemon.service.js";
import EPokemon from "../../constants/pokemon.js";
import Arena from "../../components/arena/Arena.js";
import Route from "../../constants/route.js";

class HomeModule {
  $pokemonsList = [];
  $root;

  constructor(root) {
    this.$root = root;
    this._pokemonService = new PokemonService();
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

    const pokemonsItems = document.querySelectorAll(".pokemon-item");
    if (pokemonsItems.length > 0) {
      pokemonsItems.forEach((poke) => {
        poke.onclick = () => {
          this.openModal(poke.dataset.id);
        };
      });
    }

    // const arena = new Arena(this.$pokemonsList);
    // this.$root.appendChild(arena.getArena());

    return;
    this._pokemonService.getPokemons().then((next) => {
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

  openModal = (pokemonName) => {
    this._pokemonService.getPokemon(pokemonName).then((pokemon) => {
      const modal = document.getElementById("modal");
      modal.classList.remove("hidden");
      modal.classList.add("visible");
      const btnCloseModal = document.getElementById("btn-close-modal");
      btnCloseModal.onclick = () => {
        modal.classList.remove("visible");
        modal.classList.add("hidden");
      };

      const pokemonImg = document.getElementById("pokemon-img");
      pokemonImg.src = `https://img.pokemondb.net/sprites/home/normal/${pokemonName}.png`;

      const pokemonData = document.getElementById("pokemon-data");
      const title = document.createElement("h1");
      title.innerHTML = pokemon.name.toUpperCase();

      const description = document.createElement("p");
      description.innerHTML = pokemon.category_name;

      const rarity = document.createElement("p");
      rarity.innerHTML = pokemon.rarity_name;

      pokemonData.innerHTML = "";
      pokemonData.appendChild(title);
      pokemonData.appendChild(description);
      pokemonData.appendChild(rarity);

      const pokemonGif = document.getElementById("pokemon-gif");
      pokemonGif.src = `https://play.pokemonshowdown.com/sprites/xyani/${pokemon.name}.gif`;
    });
  };

  setPokemonsList = (next) => {
    this.$pokemonsList = next;
  };
}

export default HomeModule;
