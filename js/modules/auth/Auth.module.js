import Form from "../../components/form/Form.js";
import EUserStatus from "../../constants/user-status.js";

class AuthModule {
  $root;
  $userStatus;

  constructor(root, userStatus) {
    this.$root = root;
    this.$userStatus = userStatus;
  }

  onInit = () => {
    let form;
    switch (this.$userStatus) {
      case EUserStatus.UNREGISTERED:
        form = new Form(this.$userStatus, false);
        form.setAction("login"); // public
        break;
      case EUserStatus.LOGGED_OUT:
        form = new Form(this.$userStatus, true);
        form.setAction("home"); // session
        break;
      case EUserStatus.LOGGED_IN:
        form = new Form(this.$userStatus, false);
        form.setAction("logout");
        break;
    }

    form.setMethod("post");
    this.$root.appendChild(form.getform());
  };
}

export default AuthModule;
