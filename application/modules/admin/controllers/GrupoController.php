<?php

class Admin_GrupoController extends Zend_Controller_Action {

    public function init() {

        //$this->_auth = Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("admin"))->getIdentity();
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {

        $this->view->titulo = "Grupos de Usuários";

        $model = new Application_Model_Grupo();
        $this->view->grupos = $model->recuperaTodos();
    }

    public function addAction() {

        $this->view->titulo = "Grupo de Usuário";

        $form = new Util_Forms_Grupo();
        $this->view->form = $form;

        if ($this->_request->isPost()) {
            $data = Util_Helper_Helper::filtroHTTP($this->_request->getPost());
            if ($form->isValid($data)) {
                $model = new Application_Model_Grupo();
                unset($data["submit"]);
                try {

                    $model->salvar($data);
                    $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
                } catch (Exception $e) {

                    $this->_helper->FlashMessenger(array('erro', 'Não foi possível efetuar o cadastro, tente novamente!'));
                }

                $this->_redirect('/admin/grupo/index');
            } else {

                $form->populate($data);
            }
        }
    }

    public function editAction() {

        $this->view->titulo = "Grupo de Usuário";

        $model = new Application_Model_Grupo();
        $form = new Util_Forms_Grupo();
        $id = (int) $this->_request->getParam("id", 0);
        $grupo = $model->recupera($id);
        if (count($grupo)) {

            $form->populate($grupo);
            $this->view->form = $form;
        }
        if ($this->_request->isPost()) {

            $data = $this->_request->getPost();
            if ($form->isValid($data)) {
                unset($data["submit"]);
                $data["id"] = $id;
                try {
                    $model->salvar($data);
                    $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
                } catch (Exception $e) {

                    $this->_helper->FlashMessenger(array("erro", "Não foi possível alterar este grupo!"));
                }
                $this->_redirect("/admin/grupo");
            } else {

                $form->populate($data);
            }
        }
    }

    public function deleteAction() {

        $model = new Application_Model_Grupo();
        $id = (int) $this->_request->getParam("id", 0);
        $grupo = $model->recupera($id);
        if (count($grupo)) {
            try {
                $model->exclui($id);
                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $this->_helper->FlashMessenger(array("erro", "Não foi possível excluir este usuário!"));
            }


            $this->_redirect("/admin/grupo/");
        }
    }

    public function nomeAction() {
        
        $model = new Application_Model_Grupo();
        
       var_dump($model->pegaUsuario());
        
        die();
    }

}

