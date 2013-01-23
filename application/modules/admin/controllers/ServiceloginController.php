<?php

class Admin_ServiceloginController extends Zend_Controller_Action {

    protected $_form;

    public function init() {
        $this->_form = new Util_Forms_Login();
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
       
        
    }

    public function indexAction() {
        $this->_helper->layout->DisableLayout(true);
        $this->view->message = '';

        $this->view->form = $this->_form;

        if ($this->_request->isPost()) {
            $data = $this->_request->getPost();
            if ($this->_form->isValid($data)) {
                $login = $data["login"];
                $senha = $data["senha"];
                try {
                    Util_Auth_Setup::login($login, $senha);
                    $this->_helper->FlashMessenger(array('sucesso', 'Login efetuado com sucesso!'));
                    $this->_redirect("/admin/index");
                } catch (Exception $e) {

                    $this->view->message = $e->getMessage();
                }
            } else {

                $this->_form->populate($data);
            }
        }
    }

}

