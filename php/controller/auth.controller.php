<?php
require_once 'php/model/user.model.php';
require_once 'php/view/auth.view.php';
require_once 'php/controller/pokemon.controller.php';

class AuthController
{
    private $userModel;
    private $view;
    private $pokemonController;
    private $allUsers;
    private $userName;

    public function __construct()
    {
        $this->userModel = new UserModel();
        $this->view = new AuthView();
        $this->pokemonController = new PokemonController();
        $this->allUsers = $this->userModel->getAllUsers();
    }

    public function showLogin()
    {
        return $this->view->renderAuth('login');
    }

    public function showSignup()
    {
        return $this->view->renderAuth('signup');
    }

    public function showLogout()
    {
        return $this->view->renderAuth('logout');
    }

    public function createUser()
    {
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $clearence = 'user';
        if (isset($name) && !empty($name) && isset($email) && !empty($email) && isset($password) && !empty($password)) {
            $name = strtoupper($name);
            $encriptedPass = password_hash($password, PASSWORD_DEFAULT);

            if (!$this->getExistingUser($name, $email)) {
                echo 'User already exist';
                return;
            }

            $this->userModel->createUser($name, $email, $encriptedPass, $clearence);
            $this->userName = $name;
            session_start();
            $_SESSION['NAME'] = $name;
            $this->showLogin($name);
            echo 'User created';
            return;
        }
        echo 'Input is empty!';
    }

    public function getExistingUser($name, $email)
    {
        $exist = 0;
        foreach ($this->allUsers as $user_db) {
            if ($name == $user_db->name || $email == $user_db->email) {
                $exist++;
            }
        }
        return $exist == 0;
    }

    public function verifyUser()
    {
        $name = $_POST['name'];
        $password = $_POST['password'];
        if (
            isset($name) && !empty($name) &&
            isset($password) && !empty($password)
        ) {
            $user_db = $this->userModel->getUser($name);
            if (isset($user_db) && $user_db) {
                if (password_verify($password, $user_db->password)) {
                    session_start();
                    $_SESSION['NAME'] = $user_db->name;
                    //$_SESSION['LAST_ACTIVITY'] = time();
                    $this->showHome($user_db->name);
                } else {
                    echo "111";
                    // $this->showLogIn('', 'Invalid password');
                }
            } else {
                echo "222";
                // $this->showLogIn('User do not exist', '');
            }
        } else {
            echo "333";
            // $this->showLogIn('Input is empty!', '');
        }
    }

    public function showHome($name)
    {
        $this->pokemonController->showPokemonsSession($name);
    }

    public function logout()
    {
        session_start(); // Va a buscar la cookie
        session_destroy(); // Borra la cookie que se buscó
        header('Location: ' . BASE_URL);
    }

    // public function login()
    // {
    //     if (!isset($_POST['email']) || empty($_POST['email'])) {
    //         return $this->view->showLogin('Falta completar el nombre de usuario');
    //     }

    //     if (!isset($_POST['password']) || empty($_POST['password'])) {
    //         return $this->view->showLogin('Falta completar la contraseña');
    //     }

    //     $email = $_POST['email'];
    //     $password = $_POST['password'];

    //     // Verificar que el usuario está en la base de datos
    //     $userFromDB = $this->model->getUserByEmail($email);

    //     // password: 123456
    //     // $userFromDB->password: $2y$10$xQop0wF1YJ/dKhZcWDqHceUM96S04u73zGeJtU80a1GmM.H5H0EHC
    //     if ($userFromDB && password_verify($password, $userFromDB->password)) {
    //         // Guardo en la sesión el ID del usuario
    //         session_start();
    //         $_SESSION['ID_USER'] = $userFromDB->id;
    //         $_SESSION['EMAIL_USER'] = $userFromDB->email;
    //         $_SESSION['LAST_ACTIVITY'] = time();

    //         // Redirijo al home
    //         header('Location: ' . BASE_URL);
    //     } else {
    //         return $this->view->showLogin('Credenciales incorrectas');
    //     }
    // }
}
