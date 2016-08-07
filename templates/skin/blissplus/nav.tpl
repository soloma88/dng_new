<nav id="nav" class="{if $oConfig->get('plugin.blissplus.header_bg')}use-bg{/if}">
    <div class="nav-inner">
        <div class="container">
            <a class="site-name" href="{cfg name='path.root.web'}">{cfg name='view.name'}</a>


            <div style="float: right;">
                {if $menu}
                    {if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
                {/if}
            </div>

        </div>
    </div>

</nav>