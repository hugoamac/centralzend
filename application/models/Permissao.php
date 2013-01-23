<?php

class Application_Model_Permissao extends Application_Model_Abstract {

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_Permissao();
        parent::__construct();
    }

    public function altera(array $dados) {
        if (isset($dados["id"]))
            return $this->_dbTable->update($dados, array("id=?" => $dados["id"]));
    }

    public function insere(array $dados) {

        return $this->_dbTable->insert($dados);
    }

    public function exclui($idgrupo) {
        return $this->_dbTable->delete("id_grupo=" . (int) $idgrupo);
    }

}
