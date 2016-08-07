
{*<nav id="userbar" class="clearfix">
	<form action="{router page='search'}topics/" class="search">
		<input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="input-text">
		<input type="submit" value="" title="{$aLang.search_submit}" class="input-submit icon icon-search">
	</form>

	{hook run='userbar_nav'}
	

</nav>*}


<header id="header" role="banner">
    <div class="container">
	    {hook run='header_banner_begin'}
		{**}

        <ul class="nav nav-main">
            {hook run='blog_five_menu'}
            {hook run='main_menu_item'}
        </ul>
        {hook run='main_menu'}


        {if $oUserCurrent}
            <div class="dropdown-user" id="dropdown-user">
                {if $iUserCurrentCountTalkNew}<a href="{router page='talk'}" class="new-messages"> <i class="fa fa-envelope"></i>+{$iUserCurrentCountTalkNew}</a>{/if}

                <div><a href="{router page='topic'}add/" class="write" id="modal_write_show"><i class="fa fa-plus-circle"></i>{$aLang.block_create}</a></div>

                <div class="dropdown-user-trigger" id="dropdown-user-trigger">
                    <img src="{$oUserCurrent->getProfileAvatarPath(64)}" title="{$oUserCurrent->getLogin()}" alt="avatar" class="avatar" />
                    <a href="{$oUserCurrent->getUserWebPath()}">{$oUserCurrent->getLogin()}<i class="fa fa-angle-down"></i></a>

                    <ul class="dropdown-user-menu" id="dropdown-user-menu" >
                        <li class="item-stat">
                            <div class="strength" title="{$aLang.user_skill}">

                                <div>{$oUserCurrent->getSkill()}</div>
                                <div class="vote-label">{$aLang.user_skill}</div>
                            </div>

                            <div class="rating {if $oUserCurrent->getRating() < 0}negative{/if}" title="{$aLang.user_rating}">
                                <div>{$oUserCurrent->getRating()}</div>
                                <div class="vote-label">{$aLang.user_rating}</div>
                            </div>
                            {hook run='userbar_stat_item'}
                        </li>
                        {hook run='userbar_item_first'}
                        <li class="item-profile"><a href="{$oUserCurrent->getUserWebPath()}">Мой профиль<i class="fa fa-user"></i></a></li>
                        <li class="item-favourite"><a href="{$oUserCurrent->getUserWebPath()}favourites/topics/">{$aLang.user_menu_profile_favourites}<i class="fa fa-star"></i></a></li>
                        <li class="item-messages"><a href="{router page='talk'}" id="new_messages">{$aLang.user_privat_messages}<i class="fa fa-envelope"></i></a></li>
                        <li class="item-settings"><a href="{router page='settings'}profile/">{$aLang.user_settings}<i class="fa fa-cog"></i></a></li>
                        <li class="item-create"><a href="{router page='topic'}add/">{$aLang.block_create}<i class="fa fa-plus-circle"></i></a></li>
                        {hook run='userbar_item_last'}
                        <li class="item-signout"><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.exit}<i class="fa fa-ban"></i></a></li>
                    </ul>

                </div>


            </div>
        {else}
            {*<ul class="auth">*}
                {*{hook run='userbar_item'}*}
                {*<li><a href="{router page='login'}" class="js-login-form-show">{$aLang.user_login_submit}</a></li>*}
                {*<li><a href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a></li>*}
            {*</ul>*}
         {/if}
        <div class="search-header">
            <div class="search-header-show" id="search-header-show"><i class="fa fa-search"></i>Что-нибудь ищете?</div>

            <form class="search-header-form" id="search-header-form" action="{router page='search'}topics/" style="display: none">
                <input type="text" placeholder="{$aLang.search}" maxlength="255" name="q" class="input-text">
                {*<input type="submit" value="" title="{$aLang.search_submit}" class="fa fa-search">*}
            </form>
        </div>

	    {hook run='header_banner_end'}
    </div>
</header>
