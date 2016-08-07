{if count($aTopics)>0}
    {if $oConfig->get('plugin.blissplus.topic_style') == 'tile'}
        <script>
            jQuery(window).load(function () {
                var $container = $('#masonry');

                $container.masonry({
                    columnWidth: '.grid-sizer',
                    itemSelector: ".topic-tile",
                    gutter: 0
                });
            });
        </script>
        <div id="masonry" class="topic-list js-masonry">
            <div class="grid-sizer"></div>

            {foreach from=$aTopics item=oTopic name=oP key=oD}

                {include file='topic_tile.tpl' oPosition=$smarty.foreach.oP.iteration oKey=$oD bTopicList=true}

            {/foreach}
        </div>
        <div class="clear" style="clear: both"></div>

    {else}
    	{foreach from=$aTopics item=oTopic}
    		{if $LS->Topic_IsAllowTopicType($oTopic->getType())}
    			{assign var="sTopicTemplateName" value="topic_`$oTopic->getType()`.tpl"}
    			{include file=$sTopicTemplateName bTopicList=true}
    		{/if}
    	{/foreach}
    {/if}
    {include file='paging.tpl' aPaging=$aPaging}
{else}
	{$aLang.blog_no_topic}
{/if}