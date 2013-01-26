<?php

class Util_Forms_Minhaconta extends Zend_Form {

    public function init() {


        $this->setAction("/admin/minhaconta/alterasenha");

        $id = new Zend_Form_Element_Hidden("id");
        $id->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($id);


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

}

?>
