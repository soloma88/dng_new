{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<div class="topic-tile">
    {if $oTopic->getPreviewImageWebPath()}
        <div class="preview">
            <a href="{$oTopic->getUrl()}">
                <img src="{$oTopic->getPreviewImageWebPath("335crop")}" alt="image" />
            </a>
            {if $oTopic->getCountComment()>0}
                <div class="topic-comment-count"><span>{$oTopic->getCountComment()}</span></div>
            {/if}
        </div>
    {/if}

    <div class="topic-content">
        <h1 class="topic-title word-wrap">
                <a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
        </h1>

        <div class="topic-info">
            <a href="{$oBlog->getUrlFull()}" class="topic-blog"><i class="fa fa-folder-open"></i>  {$oBlog->getTitle()|escape:'html'}</a>
        </div>

        <div class="mini-text text">
            {$oTopic->getTextShort()|strip_tags|truncate:320:'...'}
            <a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
                {if $oTopic->getCutText()}
                    {$oTopic->getCutText()}
                {else}
                    {$aLang.topic_read_more}
                {/if}
            </a>
        </div>




        <footer>
            <ul class="topic-info">

                <li class="topic-info-author"><i class="fa fa-user"></i><a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
                <li class="topic-info-time">
                    <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
                        {date_format date=$oTopic->getDateAdd() format="j F Y, H:i"}
                    </time>
                </li>

                <li id="vote_area_topic_{$oTopic->getId()}" class="vote
																{if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
																	{if $oTopic->getRating() > 0}
																		vote-count-positive
																	{elseif $oTopic->getRating() < 0}
																		vote-count-negative
																	{/if}
																{/if}

																{if $oVote}
																	voted

																	{if $oVote->getDirection() > 0}
																		voted-up
																	{elseif $oVote->getDirection() < 0}
																		voted-down
																	{/if}
																{/if}">
                    {if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
                        {assign var="bVoteInfoShow" value=true}
                    {/if}

                    <div class="vote-down" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"><i class="fa fa-minus-square"></i></div>
                    <div class="vote-count {if $bVoteInfoShow}js-infobox-vote-topic{/if}" id="vote_total_topic_{$oTopic->getId()}" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">
                        {if $bVoteInfoShow}
                            {if $oTopic->getRating() > 0}+{/if}{$oTopic->getRating()}
                        {else}
                            <a href="#" onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">?</a>
                        {/if}
                    </div>
                    <div class="vote-up" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"><i class="fa fa-plus-square"></i></div>
                    {if $bVoteInfoShow}
                        <div id="vote-info-topic-{$oTopic->getId()}" style="display: none;">
                            + {$oTopic->getCountVoteUp()}<br/>
                            - {$oTopic->getCountVoteDown()}<br/>
                            &nbsp; {$oTopic->getCountVoteAbstain()}<br/>
                            {hook run='topic_show_vote_stats' topic=$oTopic}
                        </div>
                    {/if}
                </li>



                {*
               *}



                {hook run='topic_show_info' topic=$oTopic}
            </ul>
        </footer>
    </div>
</div>