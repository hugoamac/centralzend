<?php

class Application_Model_Usuario extends Application_Model_Abstract {

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_Usuario();
        parent::__construct();
    }

    public function altera(array $dados) {
        if (isset($dados["senha"]))
            $dados["senha"] = md5($dados["senha"]);
        return $this->_dbTable->update($dados, array("id=?" => $dados["id"]));
    }

    public function insere(array $dados) {
        if (isset($dados["senha"]))
            $dados["senha"] = md5($dados["senha"]);
        return $this->_dbTable->insert($dados);
    }

}

