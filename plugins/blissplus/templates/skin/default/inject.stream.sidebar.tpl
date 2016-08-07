{if $sAction=='index' }

<li class="right sidebar-view" id="sidebar-view">
    <a href="#" title="{$aLang.block_stream}" onclick="return ls.plugin.blissplus.viewStreamBlock(this);">Прямой эфир</a>
</li>

<div id="dropdown-stream" class="mosaic-steam-sidebar">
    <div class="tip-inner tip-bg-image">
        {insert name="block" block='stream'}
    </div>
    <div class="arrow" style="visibility: inherit;"></div>
</div>
<script type="text/javascript">
    jQuery(function($){
        $('#dropdown-stream').appendTo('body');
    });
</script>
{/if}
