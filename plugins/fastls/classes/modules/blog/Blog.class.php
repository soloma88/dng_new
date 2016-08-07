<?php

/**
 * Модуль для работы с блогами
 *
 * @package modules.blog
 * @since 1.0
 */
class PluginFastls_ModuleBlog extends PluginFastls_Inherit_ModuleBlog {

    /**
     * Получает дополнительные данные(объекты) для блогов по их ID
     *
     * @param array $aBlogId	Список ID блогов
     * @param array $aAllowData	Список типов дополнительных данных, которые нужно получить для блогов
     * @param array $aOrder	Порядок сортировки
     * @return array
     */
    public function GetBlogsAdditionalData($aBlogId, $aAllowData = null, $aOrder = null) {
        if (is_null($aAllowData)) {

            $aAllowData = array();
        }
        unset($aAllowData['vote']);
        unset($aAllowData['owner']);
        unset($aAllowData['relation_user']);
        return parent::GetBlogsAdditionalData($aBlogId, $aAllowData, $aOrder);
    }

}

?>
