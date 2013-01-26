<?php

class Application_Model_Grupo extends Application_Model_Abstract {

    private static $_instance;

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_Grupo();
        parent::__construct();
    }

    public static function getInstance() {
        if (!isset(self::$_instance)) {
            self::$_instance = new self;
        }
        return self::$_instance;
    }

    public function altera(array $dados) {
        if (count($dados))
            return $this->_dbTable->update($dados, array('id=?' => $dados['id']));
    }

    public function insere(array $dados) {
        if (count($dados) > 0)
            return $this->_dbTable->insert($dados);
        return false;
    }

    public static function getNome($idgrupo) {

        $self = self::getInstance();
        $data = $self->recupera((int) $idgrupo);
        if (count($data))
            return $data["nome"];
        return 0;
    }

}

