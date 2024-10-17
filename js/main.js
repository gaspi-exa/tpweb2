import Route from "./constants/route.js";
import injectGlobalStyles from "./utils/globalStyles.js";
import HomeModule from "./modules/home/Home.module.js";
import AuthModule from "./modules/auth/Auth.module.js";
import AdminModule from "./modules/admin/Admin.module.js";
import EUserStatus from "./constants/user-status.js";
import addPokemon from "./services/pokemon.add.js";

injectGlobalStyles();
document.addEventListener("DOMContentLoaded", () => new Main().onInit());

class Main {
  $root;

  onInit = () => {
    this.checkRoots();
    if (this.$root) {
      switch (this.$root.id) {
        case Route.SIGNUP:
          new AuthModule(this.$root, EUserStatus.UNREGISTERED).onInit();
          break;
        case Route.LOGIN:
          new AuthModule(this.$root, EUserStatus.LOGGED_OUT).onInit();
          break;
        case Route.LOGOUT:
          new AuthModule(this.$root, EUserStatus.LOGGED_IN).onInit();
          break;
        case Route.HOME:
          new HomeModule(this.$root).onInit();
          break;
        // case Route.PRIVATE:
        //   new HomeModule(this.$root).onInit();
        //   break;
        // case Route.ADMIN:
        //   new AdminModule(this.$root).onInit();
        //   break;
      }
    }

    this.getRandomPokemon();

    const btnPower = document.getElementById("btn-power");
    if (btnPower) {
      btnPower.onclick = () => {
        window.open(Route.LOGOUT, "_self");
      };
    }
    const btnPokeball = document.getElementById("send");
    if (btnPower) {
      btnPokeball.onclick = () => {
        addPokemon(1, 145);
      };
    }
    const btnUpdate = document.getElementById("btn-update");
    if (btnUpdate) {
      btnUpdate.onclick = () => {
        this.getRandomPokemon();
      };
    }
  };

  checkRoots = () => {
    const roots = [
      document.getElementById(Route.SIGNUP),
      document.getElementById(Route.LOGIN),
      document.getElementById(Route.LOGOUT),
      document.getElementById(Route.HOME),

      document.getElementById(Route.ADMIN),
      document.getElementById(Route.PRIVATE),
    ];
    this.$root = roots.find((root) => root !== null);
  };

  getRandomPokemon = () => {
    fetch("http://localhost/projects/tpweb2/api/getRandomPokemon", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        mode: "no-cors",
      },
    })
      .then((response) => response.json())
      .then((pokemon) => {
        const pokemonImg = document.getElementById("random-pokemon");
        if (pokemonImg) {
          pokemonImg.setAttribute(
            "src",
            `https://play.pokemonshowdown.com/sprites/xyani/${pokemon.name}.gif`
          );
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };
}
