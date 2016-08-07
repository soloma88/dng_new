<table class="table table-blogs">
	{if $bBlogsUseOrder}
		<thead>
			<tr>
				<th class="cell-name"><a href="{$sBlogsRootPage}?order=blog_title&order_way={if $sBlogOrder=='blog_title'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_title'}class="{$sBlogOrderWay}"{/if}>{$aLang.blogs_title}</a></th>


				<th class="cell-readers">
					<a href="{$sBlogsRootPage}?order=blog_count_user&order_way={if $sBlogOrder=='blog_count_user'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_count_user'}class="{$sBlogOrderWay}"{/if}>{$aLang.blogs_readers}</a>
				</th>
				<th class="cell-rating align-center"><a href="{$sBlogsRootPage}?order=blog_rating&order_way={if $sBlogOrder=='blog_rating'}{$sBlogOrderWayNext}{else}{$sBlogOrderWay}{/if}" {if $sBlogOrder=='blog_rating'}class="{$sBlogOrderWay}"{/if}>{$aLang.blogs_rating}</a></th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-name">{$aLang.blogs_title}</th>


				<th class="cell-readers">{$aLang.blogs_readers}</th>
				<th class="cell-rating align-center">{$aLang.blogs_rating}</th>
			</tr>
		</thead>
	{/if}
	
	
	{*<tbody>
		{if $aBlogs}
			{foreach from=$aBlogs item=oBlog}
				{assign var="oUserOwner" value=$oBlog->getOwner()}

				<tr>
					<td class="cell-name" style="display: block; position: relative; min-height: 86px;">
						<a href="{$oBlog->getUrlFull()}">
							<img src="{$oBlog->getAvatarPath(100)}" title="{$oBlog->getTitle()|escape:'html'}" width="80" height="80" alt="avatar" class="avatar" />
						</a>
                        <a href="#" class="show-blog-info" onclick="return ls.infobox.showInfoBlog(this,{$oBlog->getId()});" ><i></i></a>
						<p class="blogname">
							{if $oBlog->getType() == 'close'}
								<i title="{$aLang.blog_closed}" class="icon-lock"></i>
							{/if}

                            <p><a rel="author" class="user-owner" href="{$oUserOwner->getUserWebPath()}">{$oUserOwner->getLogin()}</a></p>
						</p>
                        <ul class="action">
                            {if $oUserCurrent and $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
                            <li>
                                 <a href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;" class="button button-primary">
                                     {if $oBlog->getUserIsJoin()}
                                         {$aLang.blog_leave}
                                     {else}
                                         {$aLang.blog_join}
                                     {/if}
                                 </a>
                            </li>
                            {/if}
                        </ul>
					</td>



					<td class="cell-readers" id="blog_user_count_{$oBlog->getId()}">{$oBlog->getCountUser()}</td>
					<td class="cell-rating align-center rating {if $oBlog->getRating() < 0}negative{/if}">{$oBlog->getRating()}</td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="3">
					{if $sBlogsEmptyList}
						{$sBlogsEmptyList}
					{else}

					{/if}
				</td>
			</tr>
		{/if}
	</tbody>*}
</table>

<div class="blogs-item-list">
    {if $aBlogs}
        {foreach from=$aBlogs item=oBlog}
            {assign var="oUserOwner" value=$oBlog->getOwner()}
            <div class="blog-item">
                <div class="cover">
                    <img src="{$oBlog->getAvatarPath(258)}" title="{$oBlog->getTitle()|escape:'html'}" alt="avatar" class="blog-avatar" />
                    <div class="btn-action">
                        {if $oUserCurrent and $oUserCurrent->getId() != $oBlog->getOwnerId() and $oBlog->getType() == 'open'}
                            <a href="#" onclick="ls.blog.toggleJoin(this, {$oBlog->getId()}); return false;" class="button button-primary {if $oBlog->getUserIsJoin()}active {/if}">
                                {if $oBlog->getUserIsJoin()}
                                    {$aLang.blog_leave}
                                {else}
                                    {$aLang.blog_join}
                                {/if}
                            </a>
                        {/if}
                    </div>

                </div>
                <h2><a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a></h2>
                <p>{$iCountBlogUsers=$oBlog->getCountUser()}
                    <span id="blog_user_count_{$oBlog->getId()}">{$iCountBlogUsers}</span> {$iCountBlogUsers|declension:$aLang.reader_declension:'russian'} ·
                    {$oBlog->getCountTopic()} {$oBlog->getCountTopic()|declension:$aLang.topic_declension:'russian'}</p>

            </div>
        {/foreach}
    {/if}
</div>