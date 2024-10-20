import PokemonService from "../../services/pokemon.service.js";

class AdminModule {
  constructor() {
    this.$userId = Number(document.getElementById("user-id").innerHTML);
    this._pokemonService = new PokemonService();
  }

  onInit = () => {
    const selectsPoke = document.querySelectorAll(".select-user");
    if (selectsPoke.length > 0) {
      selectsPoke.forEach((select) => {
        select.onchange = (event) => {
          this.addPokemon(event.target.value);
        };
      });
    }

    // const success = new Success();
    // this.$root.appendChild(success.getSuccess());
    // this.$root.onclick = () => {
    //   window.open(EModules.ADMIN, "_self");
    // };
  };

  addPokemon = (pokemonId) => {
    const promise = this._pokemonService.addPokemon(this.$userId, pokemonId);
    promise.then((response) => {
      if (response) {
        this._pokemonService.getPokemonsByUser(this.$userId).then((resp) => {
          if (resp) {
            this.updateTable();
          }
        });
      }
    });
  };

  updateTable = () => {
    console.log("update table");
    location.reload();
  };
}

export default AdminModule;
