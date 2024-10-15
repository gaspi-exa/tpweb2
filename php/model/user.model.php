<?php class UserModel
{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=tpweb2;charset=utf8', 'root', '');
    }

    public function getAllUsers()
    {
        $query = $this->db->prepare('SELECT * FROM user');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function createUser($name, $email, $password, $clearance)
    {
        $query = $this->db->prepare('INSERT INTO user(name, email, password, clearance) VALUES(?, ?, ?, ?)');
        $query->execute(array($name, $email, $password, $clearance));
    }

    public function getUser($userName)
    {
        $query = $this->db->prepare("SELECT * FROM user WHERE name=?");
        $query->execute(array($userName));
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function getUserByEmail($email)
    {
        $query = $this->db->prepare("SELECT * FROM usuario WHERE email = ?");
        $query->execute([$email]);

        $user = $query->fetch(PDO::FETCH_OBJ);

        return $user;
    }
}
