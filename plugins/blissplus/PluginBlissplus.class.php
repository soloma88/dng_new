<?php
/**
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
	die('Hacking attempt!');
}

class PluginBlissplus extends Plugin {
	
	protected $aInherits=array(
		'template' => array(
			'mozaic_topic_list.tpl' => '_mozaic_topic_list.tpl',
			'actions/ActionIndex/index.tpl' => '_actions/ActionIndex/index.tpl'
		),
		'action' => array('ActionIndex', 'ActionProfile'),
    );

    /*protected $aDelegates=array(
        'template'=>array(
            'topic_photoset.tpl',

        ),
    );*/

	/**
	 * Активация плагина	 
	 */
	public function Activate() {
		return true;
	}
	/**
	 * Инициализация плагина
	 */
	public function Init() {
        //$this->Viewer_AppendScript(Plugin::GetWebPath(__CLASS__) . 'fotorama/fotorama.js');
        //$this->Viewer_AppendStyle(Plugin::GetWebPath(__CLASS__) . 'fotorama/fotorama.css');

		$this->Viewer_AppendScript(Plugin::GetTemplateWebPath(__CLASS__).'js/bliss.js');
		$this->Viewer_AppendStyle(Plugin::GetTemplateWebPath(__CLASS__).'css/style.css');
	}
}
?>