{if $oTopic}
	{assign var="oBlog" value=$oTopic->getBlog()}
	{if $oBlog->getType()!='personal'}
	<section class="block block-type-blog">
		<div class="block-content">
            <div class="cover">
                <img src="{$oBlog->getAvatarPath(258)}" title="{$oBlog->getTitle()|escape:'html'}" alt="avatar" class="blog-avatar" />
                <div class="btn-action">
                    {if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId()}
                        <button type="submit" class="button button-primary {if $oBlog->getUserIsJoin()}active{/if}" id="blog-join" data-only-text="1" onclick="ls.blog.toggleJoin(this,{$oBlog->getId()}); return false;">{if $oBlog->getUserIsJoin()}{$aLang.blog_leave}{else}{$aLang.blog_join}{/if}</button>
                    {/if}
                </div>
            </div>
            <h2>                    <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>            </h2>
            <p><span id="blog_user_count_{$oBlog->getId()}">{$oBlog->getCountUser()}</span> {$oBlog->getCountUser()|declension:$aLang.reader_declension:'russian'} ·
                {$oBlog->getCountTopic()} {$oBlog->getCountTopic()|declension:$aLang.topic_declension:'russian'}</p>

		</div>
	</section>
	{/if}
{/if}