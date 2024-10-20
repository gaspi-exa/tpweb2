import PokemonService from "../../services/pokemon.service.js";
import Route from "../../constants/route.js";

class AdminModule {
  constructor() {
    this.$userId = Number(document.getElementById("user-id").innerHTML);
    this._pokemonService = new PokemonService();
  }

  onInit = () => {
    const btnPower = document.getElementById("btn-power");
    btnPower.onclick = () => {
      window.open(Route.LOGOUT, "_self");
    };

    const btnTable = document.getElementById("btn-table");
    btnTable.onclick = () => {
      window.open("admin/" + Route.CATEGORIES, "_self");
    };

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
          this._pokemonService.getPokemonsByUser(this.$userId).then((resp) => {
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
