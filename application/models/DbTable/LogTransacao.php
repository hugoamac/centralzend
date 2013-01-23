<?php

class Application_Model_DbTable_LogTransacao extends Zend_Db_Table_Abstract {

    protected $_name = 'log_transacao';

    public function getUsuario($idusuario) {

        $db = $this->getDefaultAdapter();
        $select = $db->select()
                ->from("usu_usuario")
                ->where("id=?", $idusuario);
        $res = $db->query($select);

        return $res->fetch();
    }

    public function getOperacao($idoperacao) {

        $db = $this->getDefaultAdapter();
        $select = $db->select()
                ->from("log_operacao")
                ->where("id=?", $idoperacao);
        $res = $db->query($select);

        return $res->fetch();
    }

}

