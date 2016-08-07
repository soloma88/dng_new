<?php

class PluginBlissplus_ActionProfile extends PluginBlissplus_Inherit_ActionProfile {

	protected function EventWhois() {
		parent::EventWhois();

		if (!$this->CheckUserProfile()) {
			return parent::EventNotFound();
		}

		// Стена на главной странице профиля
		$aWall = $this->Wall_GetWall(array('wall_user_id'=>$this->oUserProfile->getId(),'pid'=>null),array('id'=>'desc'),1,Config::Get('module.wall.per_page'));
		$this->Viewer_Assign('aWall',$aWall['collection']);
		$this->Viewer_Assign('iCountWall',$aWall['count']);



        $aResult=$this->Topic_GetTopicsPersonalByUser($this->oUserProfile->getId(),1, 0,Config::Get('module.topic.per_page'));
        $aTopics=$aResult['collection'];
        /**
         * Загружаем переменные в шаблон
         */
        $this->Viewer_Assign('aTopics',$aTopics);
	}

	public function EventShutdown() {
		parent::EventShutdown();

		if (!$this->oUserProfile) {
			return ;
		}
		// Передаем список друзей на все станицы, для отображения блока с друзьями
		$aUsersFriend = $this->User_GetUsersFriend($this->oUserProfile->getId(),1,12);
		$this->Viewer_Assign('aUsersFriend',$aUsersFriend['collection']);

        // steam block
        $aEvents = $this->Stream_ReadByUserId($this->oUserProfile->getId());
        $this->Viewer_Assign('aStreamEvents', array_slice($aEvents, 0,  Config::Get('plugin.blissplus.count_steam')) );
        if (count($aEvents)) {
            $oEvenLast=end($aEvents);
            $this->Viewer_Assign('iStreamLastId', $oEvenLast->getId());
        }
        /**
         * Получаем список блогов которые создал юзер
         */
        $aBlogsOwner=$this->Blog_GetBlogsByOwnerId($this->oUserProfile->getId());
        $this->Viewer_Assign('aBlogsOwner',$aBlogsOwner);

        $aBlogUsers=$this->Blog_GetBlogUsersByUserId($this->oUserProfile->getId(),ModuleBlog::BLOG_USER_ROLE_USER);
        $this->Viewer_Assign('aBlogUsers',$aBlogUsers);

    }
}
?>