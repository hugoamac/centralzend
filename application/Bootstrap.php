<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {


    protected function _initAutoloader() {

        $autoloader = Zend_Loader_Autoloader::getInstance();
        
        $autoloader->registerNamespace("Util");

        return $autoloader;
    }

    protected function _initPlugins() {

        $bootstrap = $this->getApplication();
        if ($bootstrap instanceof Zend_Application)
            $bootstrap = $this;
        $bootstrap->bootstrap("FrontController");
        $front = $bootstrap->getResource("FrontController");
        $front->registerPlugin(new Util_Plugins_Layout());
        $front->registerPlugin(new Util_Plugins_Auth());
    }

    protected function _initViews() {

        $this->bootstrap("view");
        $view = $this->getResource("view");
        $view->headTitle("Portal Zend")->setSeparator(" | ");
        $view->headMeta()->appendHttpEquiv("content-type", "text/html;charset=UTF-8");

        Zend_Registry::set("view", $view);
    }

    protected function _initAcl() {

        $aclSetup = new Util_Acl_Setup();
    }

    protected function _initDbAdapter() {

        $config = new Zend_Config_Ini(APPLICATION_PATH . "/configs/application.ini", "production");
        $adapter = $config->resources->db->adapter;
        $options = $config->resources->db->params->toArray();

        $Db = Zend_Db::factory($adapter, $options);

        Zend_Registry::getInstance()->set("Db", $Db);
    }

}

