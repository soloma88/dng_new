{foreach from=$aReplyWall item=oReplyWall}
	{assign var="oReplyUser" value=$oReplyWall->getUser()}
	<div id="wall-reply-item-{$oReplyWall->getId()}" class="js-wall-reply-item comment wall-comment-reply">

		
		<ul class="comment-info">
			<li class="comment-avatar" ><a href="{$oReplyUser->getUserWebPath()}"><img src="{$oReplyUser->getProfileAvatarPath(48)}" title="{$oReplyUser->getLogin()}" alt="avatar" class="avatar" /></a></li>
            <li class="comment-author"><a href="{$oReplyUser->getUserWebPath()}">{$oReplyUser->getLogin()}</a></li>
			<li class="comment-date"><time datetime="{date_format date=$oReplyWall->getDateAdd() format='c'}">{date_format date=$oReplyWall->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</time></li>

		</ul>
		
		<div class="comment-content text">
			{$oReplyWall->getText()}
		</div>


        {if $oUserCurrent}
            <ul class="comment-actions">
                {if $oReplyWall->isAllowDelete()}
                    <li><a href="#" onclick="return ls.wall.remove({$oReplyWall->getId()});" class="link-dotted">{$aLang.wall_action_delete}</a></li>
                {/if}
            </ul>
        {/if}
	</div>
{/foreach}