<?php

class Application_Model_Recurso extends Application_Model_Abstract {

    public function __construct() {
        $this->_dbTable = new Application_Model_DbTable_Recurso();
        parent::__construct();
    }

    public function altera(array $dados) {
        $bResultado = false;
        if (count($dados) > 0) {

            $dataRecurso = array('id' => $dados["id"], 'area' => $dados["area"], 'nome' => $dados["recurso"]);
            $this->_dbTable->update($dataRecurso, array('id=?' => $dataRecurso['id']));

            if (is_array($dados["transacao"])) {

                $total = count($dados["id_transacao"]);

                $modelTransacao = new Application_Model_Transacao();
                foreach ($dados["transacao"] as $indice => $transacao) {
                    if ($total > $indice) {
                        $dataTransacao["id"] = $dados["id_transacao"][$indice];
                    }
                    $dataTransacao["id_recurso"] = $dados["id"];
                    $dataTransacao["transacao"] = $transacao;
                    $modelTransacao->salvar($dataTransacao);
                    unset($dataTransacao);
                }
            }

            $bResultado = true;
        }
        return $bResultado;
    }

    public function insere(array $dados) {
        if (count($dados) > 0) {

            $data["nome"] = $dados["nome"];
            $data["area"] = $dados["area"];
            $id_recurso = $this->_dbTable->insert($data);

            if ($dados["transacao"] && is_array($dados["transacao"])) {
                unset($data);
                $modelTransacao = new Application_Model_Transacao();
                foreach ($dados["transacao"] as $dados) {

                    $data["id_recurso"] = $id_recurso;
                    $data["transacao"] = $dados;
                    $modelTransacao->salvar($data);
                }
            }

            return $id_recurso;
        }
        return false;
    }

}
