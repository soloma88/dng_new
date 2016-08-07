<?php

class PluginFastls_ModuleUser extends PluginFastls_Inherit_ModuleUser {

    /**
     * Получает дополнительные данные(объекты) для юзеров по их ID
     *
     * @param array $aUserId	Список ID пользователей
     * @param array|null $aAllowData	Список типод дополнительных данных для подгрузки у пользователей
     * @return array
     */
    public function GetUsersAdditionalData($aUserId, $aAllowData = null) {
        if (is_null($aAllowData)) {
            $aAllowData = array();
            // 'vote','session','friend','geo_target','note'
        }
        unset($aAllowData['geo_target']);
        unset($aAllowData['friend']);
        unset($aAllowData['note']);
        unset($aAllowData['vote']);
        unset($aAllowData['session']);

        return parent::GetUsersAdditionalData($aUserId, $aAllowData);
    }

}

?>