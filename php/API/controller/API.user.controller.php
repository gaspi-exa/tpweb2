<?php

require_once 'php/api/view/API.view.php';
require_once 'php/api/controller/API.controller.php';
require_once 'php/controller/auth.controller.php';
require_once 'php/helpers/auth.helper.php';

class APIUserController extends APIController
{

    private $view;
    private $authHelper;

    function __construct()
    {
        parent::__construct();
        $this->view = new APIView();
        $this->authHelper = new AuthHelper();
    }

    public function getUser()
    {
        session_start();
        if ($this->authHelper->checkLoggedIn()) {
            $this->view->response($_SESSION['USER_ID'], 200);
        }
    }
}
