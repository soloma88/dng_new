{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{if $oPosition == 1 || $oPosition == 6 ||  $oPosition == 8}
{*Big*}
    {$oPreviewWidth='516crop'}
    {$oTopicType='big'}

    {$oTextTopicLength = 200}
    {$oTitleTopicLength = 100}
{else}
    {*small*}
    {$oPreviewWidth='254crop'}
    {$oTopicType='small'}

    {$oTextTopicLength = 75}
    {$oTitleTopicLength = 47}
{/if}

<div class="topic-mosaic {$oTopicType}">

    <a href="{$oTopic->getUrl()}">
        {if $oTopic->getPreviewImageWebPath()}
            <img src="{$oTopic->getPreviewImageWebPath("{$oPreviewWidth}")}" alt="image" />
        {else}
            <img src="{cfg name="path.static.skin"}/images/{$oPreviewWidth}.png}" alt="image" />
        {/if}
    </a>
    {if $oTopic->getCountComment()>0}
        <div class="topic-comment-count"><span>{$oTopic->getCountComment()}</span></div>
    {/if}
    <div class="topic-content">
        <h3  class="title-topic"><a href="{$oTopic->getUrl()}"  title="{$oTopic->getTitle()|escape:'html'}">{$oTopic->getTitle()|strip_tags|truncate:{$oTitleTopicLength}:'...'}</a></h3>
        <a  href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
        <div class="mini-text">
            {$oTopic->getTextShort()|strip_tags|truncate:{$oTextTopicLength}:'...'}
        </div>
        <a class="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>

    </div>


</div>

