<?php

/**
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
    die('Hacking attemp!');
}

class PluginFastls extends Plugin {

    public $aDelegates = array(
    );
    // Объявление переопределений (модули, мапперы и сущности)
    protected $aInherits = array(
        'entity' => array(
            'ModuleUser_EntityUser' => '_ModuleUser_EntityUser',
            'ModuleBlog_EntityBlog' => '_ModuleBlog_EntityBlog',
        ),
        'module' => array(
            'ModuleUser',
            'ModuleBlog' => '_ModuleBlog',
            'ModuleTopic' => '_ModuleTopic',
            'ModuleComment' => '_ModuleComment',
        ),
    );

    // Активация плагина
    public function Activate() {
        return true;
    }

    // Деактивация плагина
    public function Deactivate() {
        return true;
    }

    // Инициализация плагина
    public function Init() {

    }

}

?>
