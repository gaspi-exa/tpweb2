import PokemonService from "../../services/pokemon.service.js";

class HomeModule {
  constructor(root) {
    this._pokemonService = new PokemonService();
  }

  onInit = () => {
    const btnBack = document.getElementById("btn-back");
    btnBack.onclick = () => {
      window.history.back();
    };

    const pokemonsItems = document.querySelectorAll(".pokemon-item");
    if (pokemonsItems.length > 0) {
      pokemonsItems.forEach((poke) => {
        poke.onclick = () => {
          this.openModal(poke.dataset.id);
        };
      });
    }
  };

  updatePokemon = (pokemonId, rarity) => {
    const promise = this._pokemonService.updatePokemon(pokemonId, rarity);
    promise.then((response) => {
      console.log(response);
    });
  };

  setPokemonsList = (next) => {
    this.$pokemonsList = next;
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

      const selectRarity = document.getElementById("select-rarity");
      if (selectRarity.length > 0) {
        selectRarity.onchange = (event) => {
          this.updatePokemon(pokemon._id, event.target.value);
          modal.classList.remove("visible");
          modal.classList.add("hidden");
        };
      }
    });
  };
}

export default HomeModule;
