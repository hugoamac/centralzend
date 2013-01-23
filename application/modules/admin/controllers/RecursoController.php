<?php

class Admin_RecursoController extends Zend_Controller_Action {

    public function init() {
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {

        $this->view->titulo = "Recursos";

        $model = new Application_Model_Recurso();
        $recurso = $model->recuperaTodos();
        $this->view->recursos = $recurso;
    }

    public function addAction() {

        $this->view->titulo = "Recurso";

        $form = new Util_Forms_Recurso();
        $this->view->form = $form;

        if ($this->_request->isPost()) {

            $data = $this->_request->getPost();
            unset($data["submit"]);
            $model = new Application_Model_Recurso();

            try {
                $model->salvar($data);
                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $this->_helper->FlashMessenger(array('erro', 'Não foi possível cadastrar o recurso!'));
            }
            $this->_redirect('/admin/recurso/index');
        }
    }

    public function editAction() {

        $this->view->titulo = "Recurso";


        $model = new Application_Model_Recurso();
        $modelTransacao = new Application_Model_Transacao();

        $form = new Util_Forms_Recurso();

        $id = (int) $this->_request->getParam("id", 0);
        $recurso = $model->recupera($id);
        $transacao = $modelTransacao->recuperaTodos("id_recurso=$id");

        $this->view->recurso = $recurso;
        $this->view->transacao = $transacao;

        if ($this->_request->isPost()) {
            //$this->_helper->viewRenderer->setNoRender(true);
            $data = $this->_request->getPost();

            try {
                $model->salvar($data);
                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $this->_helper->FlashMessenger(array("erro", "Não foi possível alterar o recurso!"));
            }
            $this->_redirect("/admin/recurso/index");
        }
    }

    public function deleteAction() {

        $model = new Application_Model_Recurso();
        $id = (int) $this->_request->getParam("id", 0);
        $recurso = $model->recupera($id);
        if (count($recurso)) {
            try {
                $model->exclui($id);
                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $this->_helper->FlashMessenger(array("erro", "Não foi possível excluir este recurso!"));
            }


            $this->_redirect("/admin/recurso/index");
        }
    }

    /*
     * Método para exlusão de transação via ajax
     */

    public function excluitransacaoAction() {
        $this->_helper->viewRenderer->setNoRender(true);
        $this->_helper->layout->disableLayout(true);
        if ($this->_request->isPost()) {

            $data = array("status" => 2, 'msg' => "tente novamente, houve um erro em nosso servidor");
            $id = $this->_request->getPost("id");
            $model = new Application_Model_Transacao();

            if ($model->recupera($id))
                $res = $model->exclui($id);

            if (!empty($res))
                $data = array("status" => 1);
            header("content-type:application/json");
            echo Zend_Json::encode($data);
            exit;
        }
    }

}