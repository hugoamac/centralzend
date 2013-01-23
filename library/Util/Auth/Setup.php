<?php

class Util_Auth_Setup {

    public static function login($login, $senha) {

        $dbAdapter = Zend_Db_Table::getDefaultAdapter();
        $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);
        $authAdapter->setTableName("usu_usuario")
                ->setIdentityColumn("login")
                ->setCredentialColumn("senha")
                ->setCredentialTreatment("MD5(?)")
                ->setIdentity($login)
                ->setCredential($senha);

        $select = $authAdapter->getDbSelect();
        $select->join(array("g" => "usu_grupo"), "usu_usuario.id_grupo=g.id", array("grupo" => "g.nome"));

        $auth = Zend_Auth::getInstance();
        $resultado = $auth->authenticate($authAdapter);

        if ($resultado->isValid()) {

            $storage = $auth->setStorage(new Zend_Auth_Storage_Session("admin"));
            $info = $authAdapter->getResultRowObject(null, "senha");
            $storage->getStorage()->write($info);
          
            return true;
        }

        throw new Exception('Nome de usuário ou senha inválido');
    }

    public static function hasLogin() {

        if (Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("admin"))->hasIdentity())
            return true;
        return false;
    }

    public static function logout() {

        $auth = Zend_Auth::getInstance();
        $auth->setStorage(new Zend_Auth_Storage_Session("admin"))
                ->clearIdentity();
    }

}

