<?php

class Admin_PermissaoController extends Zend_Controller_Action {

    public function init() {
        $this->view->messages = $this->_helper->getHelper('FlashMessenger')->getMessages();
    }

    public function indexAction() {
        
        $this->view->titulo = "Permissão";

        if ($this->_getParam("id")) {
            $idgrupo = $this->_request->getParam("id");
            $modelrecurso = new Application_Model_Recurso();
            $recursos = $modelrecurso->recuperaTodos(array(), array("area asc", "nome asc"));
            $this->view->idgrupo = $idgrupo;
            $this->view->recursos = $recursos;
        } else
            $this->_redirect("/admin/");
    }

    public function addAction() {

        //$this->_helper->viewRenderer->setNoRender(true);

        if ($this->_request->isPost()) {
            $data = $this->_request->getPost();
            $modelPermissao = new Application_Model_Permissao();

            $idgrupo = $data["id_grupo"];

            $modelPermissao->beginTransaction();
            try {

                $modelPermissao->exclui($idgrupo);
                $vsDados = array();
                foreach ($data["id_transacao"] as $id_transacao) {

                    $vsDados = array(
                        "id_grupo" => $idgrupo,
                        "id_transacao" => $id_transacao
                    );
                    $modelPermissao->insere($vsDados);
                }

                $modelPermissao->comit();

                $this->_helper->FlashMessenger(array('sucesso', 'Operação efetuada com sucesso!'));
            } catch (Exception $e) {

                $modelPermissao->rollBack();
                $this->_helper->FlashMessenger(array('erro', 'Email já cadastrado!'));
            }
            $this->_redirect('/admin/grupo/index');
        }
    }

}

