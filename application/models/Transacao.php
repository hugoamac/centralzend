<?php

class Application_Model_Transacao extends Application_Model_Abstract {

    private static $_instance;

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_Transacao();
        parent::__construct();
    }

    public static function getInstance() {
        if (!isset(self::$_instance)) {
            self::$_instance = new self;
        }
        return self::$_instance;
    }

    public function altera(Array $dados) {
        if (count($dados))
            return $this->_dbTable->update($dados, array('id=?' => $dados['id']));
    }

    public function insere(Array $dados) {

        if (count($dados) > 0)
            return $this->_dbTable->insert($dados);
        return false;
    }

}

