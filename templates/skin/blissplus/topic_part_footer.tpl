	{assign var="oBlog" value=$oTopic->getBlog()}
	{assign var="oUser" value=$oTopic->getUser()}
	{assign var="oVote" value=$oTopic->getVote()}
	{assign var="oFavourite" value=$oTopic->getFavourite()}


	<footer class="topic-footer">
		{***}
        {*if $bTopicList}
            <div class="read-more">
                <a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
                    {if $oTopic->getCutText()}
                        {$oTopic->getCutText()}
                    {else}
                        {$aLang.topic_read_more}
                    {/if}
                </a>
            </div>
        {/if*}

        {if !$bTopicList}
            <ul class="topic-tags js-favourite-insert-after-form js-favourite-tags-topic-{$oTopic->getId()}">
			    <li><i class="fa fa-tag"></i> </li>
			
			    {strip}

				    {if $oTopic->getTagsArray()}
					    {foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
						    <li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
					    {/foreach}
				    {else}
					    <li>{$aLang.topic_tags_empty}</li>
				    {/if}
				
				    {if $oUserCurrent}
					    {if $oFavourite}
						    {foreach from=$oFavourite->getTagsArray() item=sTag name=tags_list_user}
							    <li class="topic-tags-user js-favourite-tag-user">, <a rel="tag" href="{$oUserCurrent->getUserWebPath()}favourites/topics/tag/{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
						    {/foreach}
					    {/if}
					
					    <li class="topic-tags-edit js-favourite-tag-edit" {if !$oFavourite}style="display:none;"{/if}>
						    <a href="#" onclick="return ls.favourite.showEditTags({$oTopic->getId()},'topic',this);" class="link-dotted">{$aLang.favourite_form_tags_button_show}</a>
					    </li>
				    {/if}
			    {/strip}
		    </ul>
		{/if}

		    <div class="topic-share" id="topic_share_{$oTopic->getId()}">
			    {hookb run="topic_share" topic=$oTopic bTopicList=$bTopicList}
				    <div class="yashare-auto-init" data-yashareTitle="{$oTopic->getTitle()|escape:'html'}" data-yashareLink="{$oTopic->getUrl()}" data-yashareL10n="ru" data-yashareType="button" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,lj,gplus"></div>
			    {/hookb}
		    </div>

		<ul class="topic-info">

            <li class="topic-info-author"><i class="fa fa-user"></i><a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
            <li class="topic-info-time">
                <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
                    {date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}
                </time>
            </li>
            {*{if $bTopicList}*}
                {*<li class="topic-info-comments">*}
                    {*<i class="fa fa-comment"></i>*}
                    {*<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}">{$oTopic->getCountComment()} {$oTopic->getCountComment()|declension:$aLang.comment_declension:'russian'}</a>*}
                    {*{if $oTopic->getCountCommentNew()}<span>+{$oTopic->getCountCommentNew()}</span>{/if}*}
                {*</li>*}
            {*{/if}*}
            <li class="topic-info-share"><a href="#" title="{$aLang.topic_share}" onclick="jQuery('#topic_share_{$oTopic->getId()}').slideToggle(); return false;"><i class="fa fa-share-square"></i></a></li>
            {*<li class="topic-info-favourite">*}
                {*<div onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></div>*}
                {*<span class="favourite-count" id="fav_count_topic_{$oTopic->getId()}">{$oTopic->getCountFavourite()}</span>*}
            {*</li>*}

			{hook run='topic_show_info' topic=$oTopic}
		</ul>

		
		{if !$bTopicList}
			{hook run='topic_show_end' topic=$oTopic}
		{/if}
	</footer>
</article> <!-- /.topic -->