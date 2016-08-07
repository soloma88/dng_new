<?php

class PluginBlissplus_ActionIndex extends PluginBlissplus_Inherit_ActionIndex {

	public function Init() {
		parent::Init();
		if (getRequest('aLoadAjax')) {
            /**
             * Устанавливаем формат Ajax ответа
             */
			$this->Viewer_SetResponseAjax('json');
		}

	}

	public function EventShutdown() {
		parent::EventShutdown();

		$oSmarty=$this->Viewer_GetSmartyObject();
		$aTopics=$oSmarty->getTemplateVars('aTopics');

		if (getRequest('aLoadAjax')) {
            /**
             * Возвращаем данные в ajax ответе
             */
			$this->Viewer_AssignAjax('result', $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'mozaic_topic_list.tpl'));
			$this->Viewer_AssignAjax('iCount',count($aTopics));
		}
        /**
         * Передаем в шаблон урл для загрузки в js.
         */
		$this->Viewer_Assign('oCurrentUrl',trim(Router::GetPath('index').$this->sCurrentEvent,'/'));
	}

}
?>