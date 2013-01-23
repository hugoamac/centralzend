<?php

class Util_Forms_Recurso extends Zend_Form {

    public function init() {


        $area = new Zend_Form_Element_Text("area");

        $area->setLabel("Area")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o nome da area'
                ));
        $this->addElement($area);

        $recurso = new Zend_Form_Element_Text("nome");

        $recurso->setLabel("Recurso")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o nome do recurso'
                ));
        $this->addElement($recurso);

        $transacao = new Zend_Form_Element_Text("transacao");
        $transacao->setLabel("Transação")
                ->setIsArray(true);
              



        $this->addElement($transacao);

        $submit = new Zend_Form_Element_Button("submit");
        $submit->setLabel("Salvar")
                ->setAttrib("type","submit");
                
                
        $this->addElement($submit);

        $this->setElementDecorators(array(
            'ViewHelper',
            'Errors'
        ));
    }

}

