<?php

class Application_Model_Log extends Application_Model_Abstract {

    private static $_instance;

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_LogTransacao();
    }

    public static function getInstance() {
        if (!isset(self::$_instance)) {
            self::$_instance = new self;
        }
        return self::$_instance;
    }

    public function altera(Array $dados) {
        return $this->_dbTable->update($dados);
    }

    public function insere(Array $dados) {
        return $this->_dbTable->insert($dados);
    }

    public function getUsuario($idusuario) {
        if ($this->_dbTable->getUsuario($idusuario)) {
            $dado = $this->_dbTable->getUsuario($idusuario);
            return $dado["nome"];
        }
    }

    public function getOperacao($idoperacao) {
        if ($this->_dbTable->getOperacao($idoperacao)) {
            $dado = $this->_dbTable->getOperacao($idoperacao);
            return $dado["operacao"];
        }
    }

}

