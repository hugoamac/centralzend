<?php

class Admin_LogController extends Zend_Controller_Action {

    protected $_model;
    protected $_data;

    public function init() {
        $this->_data = $this->_request->getParams();
        $this->_model = new Application_Model_Log();
    }

    public function indexAction() {

        $this->view->titulo = "Log do sistema";
        $voLog = $this->_model->recuperaTodos(array(), "data_criacao desc");
        $page = isset($this->_data["pagina"]) ? $this->_data["pagina"] : 1;
        $this->view->logs = $this->_model->paginator($voLog, $page, 20);
    }

    public function detalheAction() {

        $id = (int) $this->_request->getParam("id", 0);
        $this->view->titulo = "Detalhe do Log";

        $this->view->log = $this->_model->recupera($id);
    }

}
