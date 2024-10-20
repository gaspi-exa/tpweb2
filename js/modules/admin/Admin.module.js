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
    const btnsDelete = document.querySelectorAll(".btn-delete");
    if (btnsDelete.length > 0) {
      btnsDelete.forEach((btn) => {
        btn.onclick = () => {
          this.deletePokemon(btn.dataset.id);
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

  deletePokemon = (pokemon_name) => {
    const poke = this._pokemonService.getPokemon(pokemon_name);
    poke.then((pokemon) => {
      const pokemon_id = pokemon._id;
      const promise = this._pokemonService.deletePokemon(
        pokemon_id,
        this.$userId
      );
      promise.then((response) => {
        if (response) {
          this._pokemonService
            .getPokemonsByUser(this.$userId)
            .then((resp) => {
              this.updateTable();
            });
        }
      });
    });
  };

  updateTable = () => {
    console.log("update table");
    location.reload();
  };
}

export default AdminModule;
