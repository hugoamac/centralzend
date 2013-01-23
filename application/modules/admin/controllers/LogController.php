<?php

class Admin_LogController extends Zend_Controller_Action {

    protected $_model;

    public function init() {

        $this->_model = new Application_Model_Log();
    }

    public function indexAction() {

        $this->view->titulo = "Log do sistema";
        $this->view->logs = $this->_model->recuperaTodos(array(), "data_criacao desc");
    }

    public function detalheAction() {

        $id = (int) $this->_request->getParam("id", 0);
        $this->view->titulo = "Detalhe do Log";

        $this->view->log = $this->_model->recupera($id);
    }

}
