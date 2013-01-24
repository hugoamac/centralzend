<?php

class Admin_MinhacontaController extends Zend_Controller_Action {

    protected $_id_usuario;
    protected $_model;

    public function init() {

        $this->_id_usuario = Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("admin"))->getIdentity()->id;
        $this->_model = new Application_Model_Usuario();
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {

        $this->view->titulo = "Minha Conta";
        $form = new Util_Forms_Minhaconta();

        $dados_usuario = $this->_model->recupera(array('id=?' => $this->_id_usuario));

        if ($dados_usuario) {

            $this->view->dados = $dados_usuario;
            $form->populate($dados_usuario);
        }

        $this->view->form = $form;
    }

    public function alterasenhaAction() {

        $form = new Util_Forms_Minhaconta();

        if ($this->_request->isPost()) {

            $data = $this->_request->getPost();
            if ($form->isValid($data)) {
                unset($data["submit"], $data["senha2"]);
                try {
                    $this->_model->salvar($data);
                    $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
                } catch (Exception $e) {

                    $this->_helper->FlashMessenger(array("erro", "Não foi possível alterar este usuário!"));
                }
            } else {
                $form->populate($data);
            }
        }

        $this->_redirect("/admin/minhaconta");
    }

}

