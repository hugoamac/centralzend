<?php

class Util_Forms_Grupo extends Zend_Form {

    public function init() {
        
      
        
        $grupo = new Zend_Form_Element_Text("nome");
        $grupo->setLabel("Grupo")
                ->setRequired(true)
                ->addFilter("StringTrim")
                ->addValidator("NotEmpty")
                ->setAttribs(array(
                    'class' => 'required',
                    'title' => 'informe o nome do grupo'
                ))
                ->setDecorators(array('ViewHelper', 'Errors'));
        $this->addElement($grupo);

        $submit = new Zend_Form_Element_Button("submit");
        $submit->setLabel("Salvar")
                ->setAttrib("type", "submit")
                ->setDecorators(array('ViewHelper','Errors'));
        $this->addElement($submit);
    }

}

