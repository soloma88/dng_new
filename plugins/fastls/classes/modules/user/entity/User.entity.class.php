<?php

class PluginFastls_ModuleUser_EntityUser extends PluginFastls_Inherit_ModuleUser_EntityUser {

    // protected $session;
    protected $geoTarget = false;
    protected $userFriend = false;
    protected $vote = false;

    public function getGeoTarget() {
        if (!$this->geoTarget && ($aUserId = $this->getId())) {
            $aGeoTargets = $this->Geo_GetTargetsByTargetArray('user', $aUserId);
            if ($aGeoTargets[$aUserId]) {
                $this->_aData['geo_target'] = ($aGeoTargets[$aUserId][0] ? $aGeoTargets[$aUserId][0] : null);
                $this->geoTarget = true;
            }
        }

        return $this->_getDataOne('geo_target');
    }

    /**
     * Возвращает объект дружбы с текущим пользователем
     *
     * @return ModuleUser_EntityFriend|null
     */
    public function getUserFriend() {
        $oUserCurrent = $this->User_GetUserCurrent();
        if (!$this->userFriend && $oUserCurrent) {
            $result = $this->User_GetFriendsByArray($oUserCurrent->getId(), $this->getId());
            $this->_aData['user_friend'] = ($result[$oUserCurrent->getId()] ? $result[$oUserCurrent->getId()] : null);
            $this->userFriend = true;
        }
        return $this->_getDataOne('user_friend');
    }

    /**
     * Возвращает объект голосования за пользователя текущего пользователя
     *
     * @return ModuleVote_EntityVote|null
     */
    public function getVote() {
        if (!$this->vote) {
            $this->vote = true;
            $oUserCurrent = $this->User_GetUserCurrent();
            if (!is_null($oUserCurrent)) {
                $aVote = $this->Vote_GetVote($this->getId(), 'user', $oUserCurrent->getId());
                $this->_aData['vote'] = ($aVote ? $aVote : null);
            }
        }
        return $this->_getDataOne('vote');
    }

}

?>
