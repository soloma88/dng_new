<?php

class PluginFastls_ModuleBlog_EntityBlog extends PluginFastls_Inherit_ModuleBlog_EntityBlog {

    private $owner = false;
    private $vote = false;
    private $relation_user = false;

    /**
     * Возвращает объект пользователя хозяина блога
     *
     * @return ModuleUser_EntityUser|null
     */
    public function getOwner() {

        if (!$this->owner) {
            $user = $this->User_GetUsersAdditionalData($this->getOwnerId());
            $this->_aData['owner'] = $user[$this->getOwnerId()];
            $this->owner = true;
        }
        return $this->_getDataOne('owner');
    }

    public function getVote() {
        if (!$this->vote) {
            $this->vote = true;
            if (!$aUser = $this->User_GetUserCurrent()) {
                $this->vote = true;
                return;
            }
            $aBlogId = $this->getId();
            $aBlogsVote = $this->Vote_GetVoteByArray($aBlogId, 'blog', $aUser->getId());
            $this->_aData['vote'] = $aBlogsVote[$aBlogId];
        }
        return $this->_getDataOne('vote');
    }

    /*
     *  Вспомогательная функция для сохранения отношений пользователя с блогом
     *  @return bool|null
     */

    public function getRelationUser() {
        if (!$this->relation_user) {
            $aBlogId = $this->getId();
            $aBlogUsers = $this->Blog_GetBlogUsersByArrayBlog($aBlogId, $this->User_GetUserCurrent()->getId());

            if (isset($aBlogUsers[$aBlogId])) {
                $this->setUserIsJoin(true);
                $this->setUserIsAdministrator($aBlogUsers[$aBlogId]->getIsAdministrator());
                $this->setUserIsModerator($aBlogUsers[$aBlogId]->getIsModerator());
            } else {
                $this->setUserIsJoin(false);
                $this->setUserIsAdministrator(false);
                $this->setUserIsModerator(false);
            }


            $this->relation_user = true;
        }
        return true;
    }

    /**
     * Возвращает факт присоединения пользователя к блогу
     *
     * @return bool|null
     */
    public function getUserIsJoin() {
        $this->getRelationUser();
        return $this->_getDataOne('user_is_join');
    }

    /**
     * Проверяет является ли пользователь администратором блога
     *
     * @return bool|null
     */
    public function getUserIsAdministrator() {
        $this->getRelationUser();
        return $this->_getDataOne('user_is_administrator');
    }

    /**
     * Проверяет является ли пользователь модератором блога
     *
     * @return bool|null
     */
    public function getUserIsModerator() {
        $this->getRelationUser();
        return $this->_getDataOne('user_is_moderator');
    }

}

?>
