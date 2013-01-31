<?php

class Util_Plugins_Auth extends Zend_Controller_Plugin_Abstract {

    protected $_dbRecurso;
    protected $_dbTransacao;
    protected $_module;
    protected $_controler;
    protected $_action;
    protected $_auth;
    protected $_acl;
    protected $_notLoggedRoute = array(
        'module' => 'admin',
        'controller' => 'servicelogin',
        'action' => 'index'
    );
    protected $_forbiddenRoute = array(
        'module' => 'default',
        'controller' => 'forbidden',
        'action' => 'index'
    );

    public function preDispatch(Zend_Controller_Request_Abstract $request) {

        $this->_dbRecurso = new Application_Model_Recurso();
        $this->_dbTransacao = new Application_Model_Transacao();

        $this->_module = $request->getModuleName();
        $this->_controler = $request->getControllerName();
        $this->_action = $request->getActionName();

        $this->_acl = Zend_Registry::get('acl');

        $bool = $this->_dbRecurso->recuperaPor(array("area=?" => $this->_module, "nome=?" => $this->_controler));


        if ($bool) {


            $bool_transaction = $this->_dbTransacao->recuperaPor(array("id_recurso=?" => $bool["id"], "transacao=?" => $this->_action));
        }
        if (isset($bool_transaction) && !empty($bool_transaction)) {

            $hasIdentity = Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session($this->_module))->hasIdentity();

            if (!$hasIdentity) {

                $controller = $this->_notLoggedRoute['controller'];
                $action = $this->_notLoggedRoute['action'];
                $module = $this->_notLoggedRoute['module'];
            } else if ($hasIdentity && !$this->_isAuthorized($this->_module . ":" . $this->_controler . ":" . $this->_action)) {

                $controller = $this->_forbiddenRoute['controller'];
                $action = $this->_forbiddenRoute['action'];
                $module = $this->_forbiddenRoute['module'];
            } else {

                $controller = $request->getControllerName();
                $action = $request->getActionName();
                $module = $request->getModuleName();
            }

            $request->setControllerName($controller);
            $request->setActionName($action);
            $request->setModuleName($module);
        }
    }

    protected function _isAuthorized($recurso) {

        $this->_acl = Zend_Registry::get('acl');
        $this->_auth = Zend_Auth::getInstance()->setStorage(new Zend_Auth_Storage_Session($this->_module))->getIdentity();
        $grupo = $this->_auth->grupo;

        if (!$this->_acl->has($recurso) || !$this->_acl->isAllowed($grupo, $recurso))
            return false;
        return true;
    }

}

