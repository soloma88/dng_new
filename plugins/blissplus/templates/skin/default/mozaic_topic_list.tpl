<script type="text/javascript">

    jQuery(function($){
        ls.plugin.blissplus.aAjaxUrl={json var=$oCurrentUrl};
    });

    $(window).ready(function(){
        $('.topic-mosaic .topic-content').each(function(){
            /*ls.plugin.bliss.createTopicDescription($(this));*/
        });
    });
</script>





<div class="clearfix" id="topic-list">

    {if count($aTopics)>0}
        {foreach from=$aTopics item=oTopic  item=oTopic name=oP key=oD}
            {$oPosition=$smarty.foreach.oP.iteration}
            {$oKey=$oD}

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
            <div class="topic-mosaic {$oTopicType} {if !$oTopic->getPreviewImageWebPath()}no-preview{/if}">
                <a href="{$oTopic->getUrl()}">
                    {if $oTopic->getPreviewImageWebPath()}
                        <img src="{$oTopic->getPreviewImageWebPath("{$oPreviewWidth}")}" alt="image" />
                    {/if}
                </a>
                {if $oTopic->getCountComment()>0}
                    <div class="topic-comment-count"><span>{$oTopic->getCountComment()}</span></div>
                {/if}
                <h3  class="title-topic"><a href="{$oTopic->getUrl()}"  title="{$oTopic->getTitle()|escape:'html'}">{$oTopic->getTitle()|strip_tags|truncate:{$oTitleTopicLength}:'...'}</a></h3>
                <div class="topic-content">
                    <a  href="{$oBlog->getUrlFull()}" class="topic-blog">{$oBlog->getTitle()|escape:'html'}</a>
                    <div class="mini-text">
                        {$oTopic->getTextShort()|strip_tags|truncate:{$oTextTopicLength}:'...'}
                    </div>

                    <a class="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
                    <span class="time"> <time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
                        {date_format date=$oTopic->getDateAdd() format="j F Y"}
                    </time></span>

                </div>
            </div>
        {/foreach}

    {else}
        {$aLang.blog_no_topic}
    {/if}

</div>

{if count($aTopics)>0}
    <div id="get-more-topic" onclick="ls.plugin.blissplus.ajaxLoadMoreTopic();" style="margin: 19px auto 0;"class="button button-ajax">{$aLang.ajax_topic_more}</div>
{/if}