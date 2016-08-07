<?php

class PluginFastls_ModuleTopic extends PluginFastls_Inherit_ModuleTopic {

    /**
     * Получает дополнительные данные(объекты) для топиков по их ID
     *
     * @param array $aTopicId	Список ID топиков
     * @param array|null $aAllowData Список типов дополнительных данных, которые нужно подключать к топикам
     * @return array
     */
    public function GetTopicsAdditionalData($aTopicId, $aAllowData = null) {
        if (!$aTopicId || ( is_array($aTopicId) && !count($aTopicId))) {
            return array();
        }
        if (isset($aAllowData['simple'])) {
            /**
             * Получаем "голые" топики
             */
            $aTopics = $this->GetTopicsByArrayId($aTopicId);
        } else {
            $aTopics = parent::GetTopicsAdditionalData($aTopicId, $aAllowData);
        }

        return $aTopics;
    }

}

?>
