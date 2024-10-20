import PokemonService from "../../services/pokemon.service.js";

class HomeModule {
  constructor(root) {}

  onInit = () => {
    const btnBack = document.getElementById("btn-back");
    btnBack.onclick = () => {
      window.history.back();
    };
  };

  setPokemonsList = (next) => {
    this.$pokemonsList = next;
  };
}

export default HomeModule;
