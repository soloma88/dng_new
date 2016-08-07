<?php

/**
 * Модуль для работы с комментариями
 *
 * @package modules.comment
 * @since 1.0
 */
class PluginFastls_ModuleComment extends PluginFastls_Inherit_ModuleComment {

    /**
     * Получает дополнительные данные(объекты) для комментов по их ID
     *
     * @param array $aCommentId	Список ID комментов
     * @param array|null $aAllowData	Список типов дополнительных данных, которые нужно получить для комментариев
     * @return array
     */
    public function GetCommentsSimpleAdditionalData($aCommentId, $aAllowData = null) {
        if (is_null($aAllowData)) {
            $aAllowData = array('vote', 'target', 'favourite', 'user' => array());
        }
        //if isset vote - no blog, no topic quest -
        //else no vote, no favorite
    }

    public function GetCommentsAdditionalData($aCommentId, $aAllowData = null) {
        if (is_null($aAllowData)) {
            $aAllowData = array('target', 'user' => array());
        }

        func_array_simpleflip($aAllowData);
        if (!is_array($aCommentId)) {
            $aCommentId = array($aCommentId);
        }
        /**
         * Получаем комменты
         */
        $aComments = $this->GetCommentsByArrayId($aCommentId);
        /**
         * Формируем ID дополнительных данных, которые нужно получить
         */
        $aUserId = array();
        $aTargetId = array('topic' => array(), 'talk' => array());
        foreach ($aComments as $oComment) {
            if (isset($aAllowData['user'])) {
                $aUserId[] = $oComment->getUserId();
            }
            if (isset($aAllowData['target'])) {
                $aTargetId[$oComment->getTargetType()][] = $oComment->getTargetId();
            }
        }
        /**
         * Получаем дополнительные данные
         */
        $aUsers = isset($aAllowData['user']) && is_array($aAllowData['user']) ? $this->User_GetUsersAdditionalData($aUserId, $aAllowData['user']) : $this->User_GetUsersAdditionalData($aUserId);
        /**
         * В зависимости от типа target_type достаем данные
         */
        $aTargets = array();

        $aTargets['topic'] = $this->Topic_GetTopicsAdditionalData($aTargetId['topic'], array('blog' => array('owner' => array()), 'user' => array()));
        $aVote = array();
        if (isset($aAllowData['vote']) and $this->oUserCurrent) {
            $aVote = $this->Vote_GetVoteByArray($aCommentId, 'comment', $this->oUserCurrent->getId());
        }
        if (isset($aAllowData['favourite']) and $this->oUserCurrent) {
            $aFavouriteComments = $this->Favourite_GetFavouritesByArray($aCommentId, 'comment', $this->oUserCurrent->getId());
        }
        /**
         * Добавляем данные к результату
         */
        foreach ($aComments as $oComment) {
            if (isset($aUsers[$oComment->getUserId()])) {
                $oComment->setUser($aUsers[$oComment->getUserId()]);
            } else {
                $oComment->setUser(null); // или $oComment->setUser(new ModuleUser_EntityUser());
            }
            if (isset($aTargets[$oComment->getTargetType()][$oComment->getTargetId()])) {
                $oComment->setTarget($aTargets[$oComment->getTargetType()][$oComment->getTargetId()]);
            } else {
                $oComment->setTarget(null);
            }
            if (isset($aVote[$oComment->getId()])) {
                $oComment->setVote($aVote[$oComment->getId()]);
            } else {
                $oComment->setVote(null);
            }
            if (isset($aFavouriteComments[$oComment->getId()])) {
                $oComment->setIsFavourite(true);
            } else {
                $oComment->setIsFavourite(false);
            }
        }
        return $aComments;
    }

    /**
     * Получить комменты по владельцу
     *
     * @param  int $sId	ID владельца коммента
     * @param  string $sTargetType	Тип владельца комментария
     * @param  int $iPage	Номер страницы
     * @param  int $iPerPage	Количество элементов на страницу
     * @return array('comments'=>array,'iMaxIdComment'=>int)
     */
    public function GetCommentsByTargetId($sId, $sTargetType, $iPage = 1, $iPerPage = 0) {
        if (Config::Get('module.comment.use_nested')) {
            return $this->GetCommentsTreeByTargetId($sId, $sTargetType, $iPage, $iPerPage);
        }

        if (false === ($aCommentsRec = $this->Cache_Get("comment_target_{$sId}_{$sTargetType}"))) {
            $aCommentsRow = $this->oMapper->GetCommentsByTargetId($sId, $sTargetType);
            if (count($aCommentsRow)) {
                $aCommentsRec = $this->BuildCommentsRecursive($aCommentsRow);
            }
            $this->Cache_Set($aCommentsRec, "comment_target_{$sId}_{$sTargetType}", array("comment_new_{$sTargetType}_{$sId}"), 60 * 60 * 24 * 2);
        }
        if (!isset($aCommentsRec['comments'])) {
            return array('comments' => array(), 'iMaxIdComment' => 0);
        }
        $aComments = $aCommentsRec;
        //$aComments['comments'] = $this->GetCommentsAdditionalData(array_keys($aCommentsRec['comments']));
        $aComments['comments'] = $this->GetCommentsAdditionalData(array_keys($aCommentsRec['comments']), array('vote', 'favourite', 'user' => array()));
        foreach ($aComments['comments'] as $oComment) {
            $oComment->setLevel($aCommentsRec['comments'][$oComment->getId()]);
        }
        return $aComments;
    }

    /**
     * Получает комменты используя nested set
     *
     * @param int $sId	ID владельца коммента
     * @param string $sTargetType	Тип владельца комментария
     * @param  int $iPage	Номер страницы
     * @param  int $iPerPage	Количество элементов на страницу
     * @return array('comments'=>array,'iMaxIdComment'=>int,'count'=>int)
     */
    public function GetCommentsTreeByTargetId($sId, $sTargetType, $iPage = 1, $iPerPage = 0) {
        if (!Config::Get('module.comment.nested_page_reverse') and $iPerPage and $iCountPage = ceil($this->GetCountCommentsRootByTargetId($sId, $sTargetType) / $iPerPage)) {
            $iPage = $iCountPage - $iPage + 1;
        }
        $iPage = $iPage < 1 ? 1 : $iPage;
        if (false === ($aReturn = $this->Cache_Get("comment_tree_target_{$sId}_{$sTargetType}_{$iPage}_{$iPerPage}"))) {

            /**
             * Нужно или нет использовать постраничное разбиение комментариев
             */
            if ($iPerPage) {
                $aComments = $this->oMapper->GetCommentsTreePageByTargetId($sId, $sTargetType, $iCount, $iPage, $iPerPage);
            } else {
                $aComments = $this->oMapper->GetCommentsTreeByTargetId($sId, $sTargetType);
                $iCount = count($aComments);
            }
            $iMaxIdComment = count($aComments) ? max($aComments) : 0;
            $aReturn = array('comments' => $aComments, 'iMaxIdComment' => $iMaxIdComment, 'count' => $iCount);
            $this->Cache_Set($aReturn, "comment_tree_target_{$sId}_{$sTargetType}_{$iPage}_{$iPerPage}", array("comment_new_{$sTargetType}_{$sId}"), 60 * 60 * 24 * 2);
        }
        // $aReturn['comments'] = $this->GetCommentsAdditionalData($aReturn['comments']);
        $aReturn['comments'] = $this->GetCommentsAdditionalData($aReturn['comments'], array('vote', 'favourite', 'user' => array()));
        return $aReturn;
    }

}

?>
