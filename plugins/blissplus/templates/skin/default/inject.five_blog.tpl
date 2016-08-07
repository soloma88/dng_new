{if count($aBlogs)}
    {foreach from=$aBlogs item=oBlog}
        <li>
            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>
        </li>
    {/foreach}
{/if}