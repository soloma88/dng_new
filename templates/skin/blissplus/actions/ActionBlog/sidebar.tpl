<section class="block block-type-blog">
    <div class="block-content">
        <div class="cover">
            <img src="{$oBlog->getAvatarPath(258)}" alt="avatar" class="blog-avatar" />

            {if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId()}
                <div class="btn-action">
                    <button type="submit" class="button center button-primary{if $oBlog->getUserIsJoin()}active{/if}" id="blog-join" data-only-text="1" onclick="ls.blog.toggleJoin(this,{$oBlog->getId()}); return false;">{if $oBlog->getUserIsJoin()}{$aLang.blog_leave_new}{else}{$aLang.blog_join_new}{/if}</button>
                </div>
            {/if}
        </div>

        <p style="margin-top: 7px;">
            <span id="blog_user_count_{$oBlog->getId()}">{$iCountBlogUsers}</span> {$iCountBlogUsers|declension:$aLang.reader_declension:'russian'} · {$oBlog->getCountTopic()} {$oBlog->getCountTopic()|declension:$aLang.topic_declension:'russian'}
        </p>



        <ul class="actions center">
            {if $oUserCurrent and ($oUserCurrent->getId()==$oBlog->getOwnerId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() )}
                <li>
                    <a href="{router page='blog'}edit/{$oBlog->getId()}/" title="{$aLang.blog_edit}" class="edit">{$aLang.blog_edit}</a></li>
                {if $oUserCurrent->isAdministrator()}
                    <li><a href="#" title="{$aLang.blog_delete}" id="blog_delete_show" class="delete">{$aLang.blog_delete}</a>
                {else}
                    <a href="{router page='blog'}delete/{$oBlog->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.blog_delete}" onclick="return confirm('{$aLang.blog_admin_delete_confirm}');" >{$aLang.blog_delete}</a>
                {/if}
                </li>
            {/if}
        </ul>
    </div>
</section>


{assign var="oUserOwner" value=$oBlog->getOwner()}
<section class="block block-type-admins">
    <header class="block-header">
        <h3>{$aLang.block_admins}</h3>
    </header>

    <div class="block-content">
        <p class="sep">{$aLang.blog_user_administrators}</p>
        <ul class="user-list-avatar">
            <li style="margin-bottom: 10px;">
                <a href="{$oUserOwner->getUserWebPath()}"><img src="{$oUserOwner->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
                <span><a href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a></span>
            </li>
            {if $aBlogAdministrators}
                {foreach from=$aBlogAdministrators item=oBlogUser}
                    {assign var="oUser" value=$oBlogUser->getUser()}
                    <li style="margin-bottom: 10px;">
                        <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
                        <span><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></span>
                    </li>
                {/foreach}
            {/if}
        </ul>



        {if $aBlogModerators}
            <p class="sep">{$aLang.blog_user_moderators}</p>
            <ul class="user-list-avatar">
                {foreach from=$aBlogModerators item=oBlogUser}
                    {assign var="oUser" value=$oBlogUser->getUser()}
                    <li>
                        <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
                        <span><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></span>
                    </li>
                {/foreach}
            </ul>
        {/if}
    </div>
</section>
{if count($aBlogUsers)}
<section class="block block-type-readers">
    <header class="block-header">
        <h3>{$aLang.block_readers}</h3>
    </header>

    <div class="block-content">
        <ul class="user-list-avatar">
            {foreach from=$aBlogUsers item=oBlogUser}
                {assign var="oUser" value=$oBlogUser->getUser()}
                <li>
                    <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" class="avatar" /></a>
                    <span><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></span>
                </li>
            {/foreach}
        </ul>
    </div>
</section>
{/if}