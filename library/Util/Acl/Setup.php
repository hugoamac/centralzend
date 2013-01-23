<?php

class Util_Acl_Setup {

    protected $_acl;

    public function __construct() {
        $this->_acl = new Util_Acl_MyAcl();
        $this->_initialize();
    }

    protected function _initialize() {
        $this->_acl->roleResource();
        $this->_saveAcl();
    }

    protected function _saveAcl() {
        $registry = Zend_Registry::getInstance();
        $registry->set('acl', $this->_acl);
    }

}

