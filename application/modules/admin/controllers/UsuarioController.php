<?php

class Admin_UsuarioController extends Zend_Controller_Action {

    public function init() {
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {

        //$this->_helper->viewRenderer->setNoRender(true);   
        $this->view->titulo = "Usuários";
        $model = new Application_Model_Usuario();
        $this->view->usuario = $model->recuperaTodos();
    }

    public function addAction() {
        
         $this->view->titulo = "Usuário";
         
        $form = new Util_Forms_Usuario();
        $this->view->form = $form;

        if ($this->_request->isPost()) {
            $data = $this->_request->getPost();
            if ($form->isValid($data)) {
                unset($data['submit'], $data['senha2']);
                $model = new Application_Model_Usuario();
                try {
                    $model->salvar($data);
                    $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
                } catch (Exception $e) {

                    $this->_helper->FlashMessenger(array('erro', 'Email já cadastrado!'));
                }
                $this->_redirect('/admin/usuario/index');
            } else {

                $form->populate($data);
            }
        }
    }

    public function editAction() {
        
         $this->view->titulo = "Usuário";
        
        $model = new Application_Model_Usuario();
        $form = new Util_Forms_Usuario();
        $id = (int) $this->_request->getParam("id", 0);
        $usuario = $model->recupera($id);

        if (count($usuario)) {

            $form->populate($usuario);
            $this->view->form = $form;
        }
        if ($this->_request->isPost()) {

            $data = $this->_request->getPost();
            if ($form->isValid($data)) {
                unset($data["submit"], $data["senha2"]);
                $data["id"] = $id;
                try {
                    $model->salvar($data);
                    $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
                } catch (Exception $e) {

                    $this->_helper->FlashMessenger(array("erro", "Não foi possível alterar este usuário!"));
                }
                $this->_redirect("/admin/usuario");
            } else {
                $form->populate($data);
            }
        }
    }

    public function deleteAction() {

        $model = new Application_Model_Usuario();
        $id = (int) $this->_request->getParam("id", 0);
        $usuario = $model->recupera($id);
        if (count($usuario)) {

            try {
                $model->exclui($id);
                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $this->_helper->FlashMessenger(array("erro", "Não foi possível excluir este usuário!"));
            }


            $this->_redirect("/admin/usuario/");
        }
    }

}

