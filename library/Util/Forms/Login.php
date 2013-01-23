<?php

class Util_Forms_Login extends Zend_Form {

    public function init() {
        
         $this->setAttrib("id", "form");
    
        $login = new Zend_Form_Element_Text("login");
        $login->setLabel("Login")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o login'
                ));
        $this->addElement($login);

        $senha = new Zend_Form_Element_Password("senha");
        $senha->setLabel("Senha")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe a senha'
                ));
        $this->addElement($senha);

        $submit = new Zend_Form_Element_Button("submit");
        $submit->setLabel("Logar")
                ->setAttrib("type", "submit");

        $this->addElement($submit);
        
        $this->setElementDecorators(array("viewHelper"));
    }

}

