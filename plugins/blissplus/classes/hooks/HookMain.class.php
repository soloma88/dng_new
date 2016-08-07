<?php

class PluginBlissplus_HookMain extends Hook {

	public function RegisterHook() {
        if (Config::Get('plugin.blissplus.topic_style') == 'mosaic' ) {
            $this->AddHook('template_menu_blog_log_item', 'AddToNavSidebar', __CLASS__);
            $this->AddHook('template_menu_blog_blog_item', 'AddToNavSidebar', __CLASS__);
            $this->AddHook('template_menu_blog_index_item', 'AddToNavSidebar', __CLASS__);


        }
        if (Config::Get('plugin.blissplus.themes') == 'user' ) {
            $this->AddHook('template_html_head_end', 'addUserTheme', __CLASS__);
        }
        $this->AddHook('template_blog_five_menu', 'addFiveBlog', __CLASS__);
        $this->AddHook('template_profile_sidebar_userBlogs', 'addUserBlogs', __CLASS__);

    }
    /*добавляем кнопку показа сайдбара в мозайке*/
	public function AddToNavSidebar() {
			return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.stream.sidebar.tpl');

	}
    public function addUserTheme() {
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'user_theme.tpl');
    }

    public function addFiveBlog() {
        if ($aResult=$this->Blog_GetBlogsRating(1, 5)) {
            $aBlogs=$aResult['collection'];
            /**
             * Формируем результат в виде шаблона и возвращаем
             */
            $this->Viewer_Assign('aBlogs', $aBlogs);
            return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.five_blog.tpl');

        }

    }

    public function addUserBlogs($aParams) {
        /**
         * Получаем список блогов и формируем ответ
         */
        $oUserProfile=$aParams['oUserProfile'];

        if( $aBlogsOwner=$this->Blog_GetBlogsByOwnerId($oUserProfile->getId())){
            $this->Viewer_Assign('aBlogsOwner',$aBlogsOwner);

        }

        /*if ($aBlogsSelf=$this->Blog_GetBlogsRatingSelf($oUserProfile->getId())) {
            $this->Viewer_Assign('sBlogsSelf', $aBlogsSelf);
        }*/
        if ($aBlogs=$this->Blog_GetBlogsRatingJoin($oUserProfile->getId(),Config::Get('block.blogs.row'))) {
            $this->Viewer_Assign('sBlogsJoin',$aBlogs);
        }
        return $this->Viewer_Fetch(Plugin::GetTemplatePath(__CLASS__).'inject.user_blogs.tpl');

    }
}
?>