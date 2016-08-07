{if $sAction=='index' && ($oConfig->get('plugin.blissplus.topic_style') == 'mosaic') } {assign var="noSidebar" value=true} {/if}

{include file='header.tpl' menu='blog' menu_content='blog'}


{if $sAction=='index' && ($oConfig->get('plugin.blissplus.topic_style') == 'mosaic') }
    {include file='mozaic_topic_list.tpl'}
{else}
    {include file='topic_list.tpl'}
{/if}


{include file='footer.tpl'}