<?php

class Admin_IndexController extends Zend_Controller_Action {

    public function init() {
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {
        //$this->_helper->layout->DisableLayout(true);
        
        $this->view->titulo="Bem vindo a sua Área Administrativa";
        if (!Util_Auth_Setup::hasLogin())
            $this->_redirect("/admin/servicelogin/");
    }

    public function logoutAction() {
        Util_Auth_Setup::logout();
        return $this->_redirect("/admin/servicelogin/");
    }

}