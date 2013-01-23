<?php

class Util_Acl_MyAcl extends Zend_Acl {

    private $_db;
    public $_getGrupoDoUsuario = null;
    public $_getIdGrupoDoUsuario = null;
    public $_idusuario = null;
    public $_usuario = null;

    public function __construct() {

        $this->_db = Zend_Db::factory('Pdo_Mysql', array(
                    'host' => 'localhost',
                    'username' => 'root',
                    'password' => 'lordswxp',
                    'dbname' => 'zend'
                ));
    }

    private function initRoles() {
        $roles = $this->_db->fetchAll(
                $this->_db->select()
                        ->from("usu_grupo")
                        ->order(array("id DESC")));
        //$this->addRole(new Zend_Acl_Role($roles[0]['nome']));
        for ($i = 0; $i < count($roles); $i++) {
            $this->addRole(new Zend_Acl_Role($roles[$i]['nome']));
            // $this->addRole(new Zend_Acl_Role($roles[$i]['nome']), $roles[$i - 1]['nome']);
        }
    }

    private function initResources() {
        self::initRoles();
        $resources = $this->_db->fetchAll(
                $this->_db->select()
                        ->from(array("r" => "usu_recurso"))
                        ->join(array("t" => "usu_recurso_transacao"), "r.id=t.id_recurso")
        );

        foreach ($resources as $key => $value) {
            if (!$this->has($value['area'] . ":" . $value['nome'] . ":" . $value['transacao'])) {
                $this->add(new Zend_Acl_Resource($value['area'] . ":" . $value['nome'] . ":" . $value['transacao']));
            }
        }
    }

    public function roleResource() {
        self::initResources();
        $acl = $this->_db->fetchAll(
                $this->_db->select()
                        ->from(array("g" => "usu_grupo"), array("grupo_nome" => "nome"))
                        ->from(array("r" => "usu_recurso"), array("recurso_nome" => "nome", "area_modulo" => "area"))
                        ->from(array("t" => "usu_recurso_transacao"), array("transacao_nome" => "transacao"))
                        ->from(array("p" => "usu_grupo_permissao"))
                        ->where("p.id_grupo=g.id")
                        ->where("r.id=t.id_recurso")
                        ->where("p.id_transacao=t.id"));

        foreach ($acl as $value) {
            $this->allow($value['grupo_nome'], $value['area_modulo'] . ":" . $value['recurso_nome'] . ":" . $value['transacao_nome']);
        }
    }

    public function listRoles() {
        return $this->_db->fetchAll(
                        $this->_db->select()
                                ->from("usu_grupo"));
    }

    public function getRoleId($roleName) {
        return $this->_db->fetchRow(
                        $this->_db->select()
                                ->from("usu_grupo", "id")
                                ->where("usu_grupo.nome = '" . $roleName . "'"));
    }

    public function listResources() {
        return $this->_db->fetchAll(
                        $this->_db->select()
                                ->from("usu_recurso")
                                ->from("usu_recurso_transacao")
                                ->where("usu_recurso.id = usu_recurso_transacao.id"));
    }

    public function createAclUsuario($idusuario) {

        $this->_idusuario = $idusuario;
        //$this->_db = Zend_Registry::get("database");
        //self::roleResource();

        $dados = $this->_db->fetchRow(
                $this->_db->select()
                        ->from(array("g" => "usu_grupo"), array("grupo_id" => "id", "grupo_nome" => "nome"))
                        ->from(array("u" => "usu_usuario"))
                        ->where("u.nome = '" . $this->_idusuario . "'")
                        ->where("u.id_grupo= g.id"));

        $this->_getIdGrupoDoUsuario = $dados['id_grupo'] ? $dados['id_grupo'] : 5;
        $this->_getGrupoDoUsuario = $dados['grupo_nome'] ? $dados['grupo_nome'] : "usuario";
        $this->_usuario = $dados["nome"];

        $this->addRole(new Zend_Acl_Role($this->_usuario), $this->_getGrupoDoUsuario);
    }

    public function listResourcesByGroup($idgrupo) {
        $result = null;
        $group = $this->_db->fetchAll($this->_db->select()
                        ->from(array("p" => "usu_grupo_permissao"))
                        ->from(array("r" => "usu_recurso"), array("recurso_nome" => "nome"))
                        ->from(array("t" => "usu_recurso_transacao"), array("transacao_nome" => "transacao"))
                        ->where("p.id_grupo = " . (int) $idgrupo . "")
                        ->where("t.id=p.id_transacao")
                        ->where("r.id=t.id_recurso")
        );
        foreach ($group as $key => $value) {
            if ($this->isAllowed($this->_usuario, $value['recurso_nome'], $value['transacao_nome'])) {
                $result[] = $value['transacao_nome'];
            }
        }
        return $result;
    }

    /*
     *
     * verifica se usuario e permitido
     *
     */

    public function isUserAllowed($resource, $permission) {
        return ($this->isAllowed($this->_usuario, $resource, $permission));
    }

}

