<?php
class APIView {

public function response($data, $code) {
    header("Content-Type: application/json");
    header("HTTP/1.1 " . $code . " " . $this->requestStatus($code));
    //ANTI-CORS:
    //Permite el acceso a los recursos desde cualquier origen (también se puede espicificar)
    header('Access-Control-Allow-Origin: *');
    //Acepta diversos content-type
    header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
    //Permite diversos métodos de conexión
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    echo json_encode($data);
}

private function requestStatus($code) {
    $status = array(
      200 => "OK",
      404 => "Not found",
      500 => "Internal Server Error"
    );
    return (isset($status[$code]))? $status[$code] : $status[500];
}

public function vardampea($data) {
    var_dump($data);
}

}