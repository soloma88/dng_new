{hook run='profile_sidebar_begin' oUserProfile=$oUserProfile}

<section class="block block-type-profile no-heder-text">
	<div class="profile-photo-wrapper">
		{*<div class="status ">{if $oUserProfile->isOnline()}{$aLang.user_status_online}{else}{$aLang.user_status_offline}{/if}</div>*}
		<a href="{$oUserProfile->getUserWebPath()}"><img src="{$oUserProfile->getProfileFotoPath()}" alt="photo" class="profile-photo" id="foto-img" /></a>

        {if $sAction=='settings' and $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
            <p class="upload-photo">
                <a href="#" id="foto-upload">{if $oUserCurrent->getProfileFoto()}{$aLang.settings_profile_photo_change}{else}{$aLang.settings_profile_photo_upload}{/if}</a>&nbsp;&nbsp;&nbsp;
                <a href="#" id="foto-remove" onclick="return ls.user.removeFoto();" style="{if !$oUserCurrent->getProfileFoto()}display:none;{/if}">{$aLang.settings_profile_foto_delete}</a>
            </p>
        {/if}
    </div>
	
	{if $sAction=='settings' and $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
		<script type="text/javascript">
			jQuery(function($){
				$('#foto-upload').file({ name:'foto' }).choose(function(e, input) {
					ls.user.uploadFoto(null,input);
				});
			});
		</script>
		

		<div class="modal" id="foto-resize">
			<header class="modal-header">
				<h3>{$aLang.uploadimg}</h3>
			</header>
			
			<div class="modal-content">
				<img src="" alt="" id="foto-resize-original-img"><br />
				<button type="submit" class="button button-primary" onclick="return ls.user.resizeFoto();">{$aLang.settings_profile_avatar_resize_apply}</button>
				<button type="submit" class="button" onclick="return ls.user.cancelFoto();">{$aLang.settings_profile_avatar_resize_cancel}</button>
			</div>
		</div>
	{/if}
    {*****************************************
    **************       actions *************}
    {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
        <script type="text/javascript">
            jQuery(function($){
                ls.lang.load({lang_load name="profile_user_unfollow,profile_user_follow"});
            });
        </script>
        <ul class="profile-actions" id="profile_actions">
            {include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
            <li><a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}" class="button button-actions"><i class="fa fa-envelope"></i></a></li>
            <li>
               <a href="#" onclick="newFollowToggle(this, {$oUserProfile->getId()}); return false;" class="{if $oUserProfile->isFollow()}followed{/if} button button-actions">
                   <i class="fa fa-share"></i>
               </a>
            </li>
        </ul>
    {/if}
    <ul class="nav nav-profile">
        {hook run='profile_sidebar_menu_item_first' oUserProfile=$oUserProfile}
        <li {if $sAction=='profile' && ($aParams[0]=='whois' or $aParams[0]=='')}class="active"{/if}> <a href="{$oUserProfile->getUserWebPath()}"><i class="fa fa-user"></i>{$aLang.user_menu_profile_whois}</a></li>
        {*<li {if $sAction=='profile' && $aParams[0]=='wall'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}wall/">{$aLang.user_menu_profile_wall}{if ($iCountWallUser)>0} ({$iCountWallUser}){/if}</a></li>*}
        <li {if $sAction=='profile' && $aParams[0]=='created'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}created/topics/"><i class="fa fa-pencil"></i>{$aLang.user_menu_publication}{if ($iCountCreated)>0} ({$iCountCreated}){/if}</a></li>
        <li {if $sAction=='profile' && $aParams[0]=='favourites'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}favourites/topics/"><i class="fa fa-star"></i>{$aLang.user_menu_profile_favourites}{if ($iCountFavourite)>0} ({$iCountFavourite}){/if}</a></li>
        <li {if $sAction=='profile' && $aParams[0]=='friends'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}friends/"><i class="fa fa-users"></i>{$aLang.user_menu_profile_friends}{if ($iCountFriendsUser)>0} ({$iCountFriendsUser}){/if}</a></li>
        <li {if $sAction=='profile' && $aParams[0]=='stream'}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}stream/"><i class="fa fa-tasks"></i>{$aLang.user_menu_profile_stream}</a></li>

        {if $oUserCurrent and $oUserCurrent->getId() == $oUserProfile->getId()}
            <li {if $sAction=='talk'}class="active"{/if}><a href="{router page='talk'}"><i class="fa fa-envelope"></i>{$aLang.talk_menu_inbox}{if $iUserCurrentCountTalkNew} ({$iUserCurrentCountTalkNew}){/if}</a></li>
            <li {if $sAction=='settings'}class="active"{/if}><a href="{router page='settings'}"><i class="fa fa-cog"></i>{$aLang.settings_menu}</a></li>
        {/if}
        {hook run='profile_sidebar_menu_item_last' oUserProfile=$oUserProfile}
    </ul>
</section>
{hook run='profile_sidebar_menu_before' oUserProfile=$oUserProfile}


{if $oUserCurrent && $oUserCurrent->getId() != $oUserProfile->getId()}
	<section class="block block-type-profile-note">
		{if $oUserNote}
			<script type="text/javascript">
				ls.usernote.sText = {json var = $oUserNote->getText()};
			</script>
		{/if}

		<div id="usernote-note" class="profile-note" {if !$oUserNote}style="display: none;"{/if}>
			<p id="usernote-note-text">
				{if $oUserNote}
					{$oUserNote->getText()}
				{/if}
			</p>
			
			<ul class="actions">
				<li><a href="#" onclick="return ls.usernote.showForm();" class="link-dotted">{$aLang.user_note_form_edit}</a></li>
				<li><a href="#" onclick="return ls.usernote.remove({$oUserProfile->getId()});" class="link-dotted">{$aLang.user_note_form_delete}</a></li>
			</ul>
		</div>
		
		<div id="usernote-form" style="display: none;">
			<p><textarea rows="4" cols="20" id="usernote-form-text" class="input-text input-width-full"></textarea></p>
			<button type="submit" onclick="return ls.usernote.save({$oUserProfile->getId()});" class="button button-primary">{$aLang.user_note_form_save}</button>
			<button type="submit" onclick="return ls.usernote.hideForm();" class="button">{$aLang.user_note_form_cancel}</button>
		</div>
		
		<a href="#" onclick="return ls.usernote.showForm();" id="usernote-button-add" class="link-dotted" {if $oUserNote}style="display:none;"{/if}>{$aLang.user_note_add}</a>
	</section>
{/if}

{*
    stream
*}
{if count($aStreamEvents)}
    <section class="block block-type-profile-stream">
        <header class="block-header">
            <h3>{$aLang.profile_block_stream}</h3>
        </header>
        <div class="block-content">
            <ul class="stream-list" id="stream-list">
                {include file='actions/ActionStream/events_block.tpl'}
            </ul>
        </div>
    </section>

{/if}

{hook run='profile_sidebar_userBlogs' oUserProfile=$oUserProfile}



{*
  Созданные блоги

{if count($aBlogsOwner) }
    <section class="block block-type-profile-friends">
        <header class="block-header">
            <h3>СОЗДАЛ</h3>
        </header>
        <div class="block-content">
            <ul class="user-list-avatar">
                {foreach from=$aBlogsOwner item=oBlog name=blog_owner}
                    <li style="margin-bottom: 10px;">
                        <a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" title="{$oBlog->getTitle()|escape:'html'}" class="avatar" /></a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </section>
{/if}
*}
{*if count($aBlogUsers) }
    <section class="block block-type-profile-friends">
        <header class="block-header">
            <h3>СОСТОИТ В</h3>
        </header>
        <div class="block-content">
            <ul class="user-list-avatar">
                {foreach from=$aBlogUsers item=oBlogUser name=blog_user}
                    <li style="margin-bottom: 10px;">
                        {assign var="oBlog" value=$oBlogUser->getBlog()}
                        <a href="{$oBlog->getUrlFull()}"><img src="{$oBlog->getAvatarPath(48)}" alt="avatar" title="{$oBlog->getTitle()|escape:'html'}" class="avatar" /></a>
                    </li>
                {/foreach}
            </ul>
        </div>
    </section>
{/if*}

{hook run='profile_sidebar_end' oUserProfile=$oUserProfile}



