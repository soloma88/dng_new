{if $aBlogsOwner || $sBlogsJoin}
<div class="block block-type-blogs" id="block_blogs">
    <div class="block-inner">
        <header class="block-header">
            <h3>Подписки</h3>
        </header>


        <div class="block-content">
            <div class="js-block-blogs-content">
                {include file="blocks/block.blogs_top.tpl" aBlogs=$aBlogsOwner}
                {include file="blocks/block.blogs_top.tpl" aBlogs=$sBlogsJoin}

            </div>
        </div>
    </div>
</div>
{/if}