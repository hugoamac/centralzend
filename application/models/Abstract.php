<?php

abstract class Application_Model_Abstract {

    protected $_dbTable;
    protected $_id_usuario;
    protected $_log_transacao;
    protected $_tabela;
    protected $_log;

    public function __construct() {

        $this->_log = TRUE;
        $info = $this->_dbTable->info();
        $this->_tabela = $info["name"];
        $this->_log_transacao = new Application_Model_DbTable_LogTransacao();
        if (Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("admin"))->hasIdentity()) {
            $this->_id_usuario = Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session("admin"))->getIdentity()->id;
        }
    }

    public function recupera($id) {
        return $this->_dbTable->find($id)->current()->toArray();
    }

    public function exclui($id) {

        if ($this->_log) {
            $dados["id_excluido"] = (int) $id;
            $this->saveLog($dados);
        }
        return $this->_dbTable->delete("id=" . (int) $id);
    }

    public function salvar(Array $dados) {



        if (isset($dados['id'])) {

            if ($this->_log) {
                $dados["id_editado"] = $dados['id'];
                $this->saveLog($dados);
            }

            unset($dados["id_editado"]);

            return $this->altera($dados);
        } else {

            $id_inserida = $this->insere($dados);
            if ($this->_log) {
                $dados["id_inserido"] = $id_inserida;
                $this->saveLog($dados);
            }
            return $id_inserida;
        }
    }

    abstract public function altera(Array $dados);

    abstract public function insere(Array $dados);

    public function recuperaTodos($where = null, $ordem = null, $limit = null) {
        $res = $this->_dbTable->fetchAll($where, $ordem, $limit);
        if (count($res))
            return $res->toArray();
        return array();
    }

    public function beginTransaction() {

        return $this->_dbTable->getAdapter()->beginTransaction();
    }

    public function comit() {

        return $this->_dbTable->getAdapter()->commit();
    }

    public function rollBack() {

        return $this->_dbTable->getAdapter()->rollBack();
    }

    public function recuperaPor($where = null, $ordem = null) {
        $res = $this->_dbTable->fetchRow($where, $ordem);
        if (count($res))
            return $res->toArray();
        return array();
    }

    private function saveLog($dados) {

        if (isset($dados["id_inserido"])) {
            $log["id_usuario"] = $this->_id_usuario;
            $log["id_operacao"] = 1;
            $log["tabela"] = $this->_tabela;
            $log["dados"] = "Dados inserido: </br>
                            Id: " . $dados["id_inserido"] . "</br>
                            Dados:</br>";
            unset($dados["id_inserido"]);
            if (isset($dados["senha"])) {
                unset($dados["senha"]);
            }
            foreach ($dados as $col => $val) {


                $log["dados"] .= "{$col} : {$val}<br/>";
            }
        } elseif (isset($dados["id_editado"])) {

            $dados_antigos = $this->_dbTable->fetchRow(array("id=?" => $dados["id_editado"]))->toArray();
            if (isset($dados["senha"]) || isset($dados_antigos["senha"])) {
                unset($dados["senha"], $dados_antigos["senha"]);
            }

            $log["id_usuario"] = $this->_id_usuario;
            $log["id_operacao"] = 2;
            $log["tabela"] = $this->_tabela;
            $log["dados"] = "Os Dados:<br/><br/>";
            foreach ($dados_antigos as $col => $val) {
                $log["dados"].="{$col} : {$val}<br/>";
            }
            $log["dados"].="<br/>Foram alterados para:<br/><br/>";
            unset($dados["id_editado"]);

            foreach ($dados as $col => $val) {

                $log["dados"].="{$col} : {$val}<br/>";
            }
        } elseif (isset($dados["id_excluido"])) {

            $dados_excluido = $this->_dbTable->fetchRow(array("id=?" => $dados["id_excluido"]))->toArray();
            if (isset($dados_excluido["senha"])) {
                unset($dados_excluido["senha"]);
            }

            $log["id_usuario"] = $this->_id_usuario;
            $log["id_operacao"] = 3;
            $log["tabela"] = $this->_tabela;
            $log["dados"] = "Dados excluidos: </br>
                            Id: " . $dados["id_excluido"] . "</br>
                            Dados:</br>";
            unset($dados);
            foreach ($dados_excluido as $col => $val) {
                $log["dados"] .= "{$col} : {$val}<br/>";
            }
        }

        $this->_log_transacao->insert($log);
    }

    public function paginator($voDados, $page = 1, $qnt = 30) {

        $data = Zend_Controller_Front::getInstance()->getRequest()->getParams();

        $page = (isset($data['pagina'])) ? $data['pagina'] : $page;
        $paginator = Zend_Paginator::factory($voDados);
        $paginator->setCurrentPageNumber($page);
        $paginator->setItemCountPerPage($qnt);

        return $paginator;
    }

}

