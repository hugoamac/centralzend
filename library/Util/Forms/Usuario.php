<?php

class Util_Forms_Usuario extends Zend_Form {

    public function init() {

        $modelgrupo = new Application_Model_Grupo();
        $grupos = $modelgrupo->recuperaTodos();

        $select_grupo = new Zend_Form_Element_Select("id_grupo");
        $select_grupo->setLabel("Grupo do Usuário")
                ->setRequired(true);
        $select_grupo->addMultiOption("", "Selecione");

        foreach ($grupos as $grupo) {

            $select_grupo->addMultiOption($grupo['id'], $grupo['nome']);
        }
        $select_grupo->setAttrib("class", "required")
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($select_grupo);

        $nome = new Zend_Form_Element_Text("nome");
        $nome->setLabel("Nome")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o nome do usuário'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($nome);

        $login = new Zend_Form_Element_Text("login");
        $login->setLabel("login")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o login do usuário'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($login);

        $email = new Zend_Form_Element_Text("email");
        $email->setLabel("Email")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidators(array(
                    array('NotEmpty', true),
                    array('EmailAddress', true)
                ))
                ->setAttribs(array(
                    'class' => 'required email',
                    'title' => 'informe o email do usuário'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($email);

        $senha = new Zend_Form_Element_Password("senha");
        $senha->setLabel("Senha")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe a senha do usuário'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($senha);

        $senha2 = new Zend_Form_Element_Password("senha2");
        $senha2->setLabel("Confirmar Senha")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->addValidators(array(array('identical', false, array('token' => 'senha'))))
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe a senha do usuário novamente'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($senha2);

        $submit = new Zend_Form_Element_Button("submit");
        $submit->setLabel("Salvar")
                ->setAttrib("type", "submit")
                ->setDecorators(array('ViewHelper', 'Errors'));

        $this->addElement($submit);
    }

    /* public function isValid($data) {

      if (isset($data["email"]) && !empty($data["email"])) {

      $emailvalidator = new Zend_Validate_Db_NoRecordExists("usu_usuario", "email");
      $this->getElement("email")
      ->addValidator($emailvalidator);
      }

      return parent::isValid($data);
      } */
}

?>
