import Route from "./constants/route.js";
import injectGlobalStyles from "./utils/globalStyles.js";
import HomeModule from "./modules/home/Home.module.js";
import ArenaModule from "./modules/home/Arena.module.js";
import AuthModule from "./modules/auth/Auth.module.js";
import AdminModule from "./modules/admin/Admin.module.js";
import EUserStatus from "./constants/user-status.js";
import PokemonService from "./services/pokemon.service.js";
import UserService from "./services/user.service.js";

injectGlobalStyles();
document.addEventListener("DOMContentLoaded", () => new Main().onInit());

class Main {
  $root;

  constructor() {
    this._pokemonService = new PokemonService();
    this._userService = new UserService();
  }

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
        case Route.ARENA:
          new ArenaModule(this.$root).onInit();
          break;
        case Route.ADMIN:
          new AdminModule(this.$root).onInit();
          break;
      }
    }
  };

  checkRoots = () => {
    const roots = [
      /* AUTH */
      document.getElementById(Route.SIGNUP),
      document.getElementById(Route.LOGIN),
      document.getElementById(Route.LOGOUT),
      /* SESSION */
      document.getElementById(Route.ARENA),
      /* ADMIN */
      document.getElementById(Route.ADMIN),
    ];
    this.$root = roots.find((root) => root !== null);
  };
}
