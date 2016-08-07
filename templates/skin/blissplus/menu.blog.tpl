{*<ul class="nav nav-filter">*}
    {*<li {if $sMenuItemSelect=='index'}class="active"{/if}>*}
        {*<a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a>*}
    {*</li>*}

    {*<li {if $sMenuItemSelect=='blog'}class="active"{/if}>*}
        {*<a href="{router page='blog'}">{$aLang.blog_menu_collective}</a>*}
    {*</li>*}

    {*<li {if $sMenuItemSelect=='log'}class="active"{/if}>*}
        {*<a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a>*}
    {*</li>*}

    {*{if $oUserCurrent}*}
        {*<li {if $sMenuItemSelect=='feed'}class="active"{/if}>*}
            {*<a href="{router page='feed'}">{$aLang.userfeed_title}</a>*}
        {*</li>*}
    {*{/if}*}

    {*{hook run='menu_blog'}*}
{*</ul>*}
{*<div class="nav-filter-wrapper">
    <ul class="nav nav-filter">

        <li {if $sMenuItemSelect=='index' || $sMenuItemSelect=='blog' || $sMenuItemSelect=='log'}class="active"{/if}>
            {if $sMenuItemSelect=='index' }
                <a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a> {if $iCountTopicsNew>0}<a href="{router page='index'}newall/" class="new">+{$iCountTopicsNew}</a>{/if}
                <ul class="sub-menu">
                    <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a> {if $iCountTopicsCollectiveNew>0}<a href="{router page='blog'}new/" class="new">+{$iCountTopicsCollectiveNew}</a>{/if}</li>
                    <li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a> {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new">+{$iCountTopicsPersonalNew}</a>{/if}</li>
                </ul>
            {elseif $sMenuItemSelect=='blog'}
                <a href="{router page='blog'}">{$aLang.blog_menu_collective}</a> {if $iCountTopicsCollectiveNew>0}<a href="{router page='blog'}new/" class="new">+{$iCountTopicsCollectiveNew}</a>{/if}
                <ul class="sub-menu">
                    <li {if $sMenuItemSelect=='index'}class="active"{/if}> <a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a> {if $iCountTopicsNew>0}<a href="{router page='index'}newall/" class="new">+{$iCountTopicsNew}</a>{/if}</li>
                    <li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a> {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new">+{$iCountTopicsPersonalNew}</a>{/if}</li>
                </ul>
            {elseif $sMenuItemSelect=='log'}
                <a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a> {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new">+{$iCountTopicsPersonalNew}</a>{/if}
                <ul class="sub-menu">
                    <li {if $sMenuItemSelect=='index'}class="active"{/if}> <a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a> {if $iCountTopicsNew>0}<a href="{router page='index'}newall/" class="new">+{$iCountTopicsNew}</a>{/if}</li>
                    <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a> {if $iCountTopicsCollectiveNew>0}<a href="{router page='blog'}new/" class="new">+{$iCountTopicsCollectiveNew}</a>{/if}</li>
                </ul>
            {else}
                <a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a> {if $iCountTopicsNew>0}<a href="{router page='index'}newall/" class="new">+{$iCountTopicsNew}</a>{/if}
                <ul class="sub-menu">
                    <li {if $sMenuItemSelect=='blog'}class="active"{/if}><a href="{router page='blog'}">{$aLang.blog_menu_collective}</a> {if $iCountTopicsCollectiveNew>0}<a href="{router page='blog'}new/" class="new">+{$iCountTopicsCollectiveNew}</a>{/if}</li>
                    <li {if $sMenuItemSelect=='log'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a> {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new">+{$iCountTopicsPersonalNew}</a>{/if}</li>
                </ul>
            {/if}
        </li>



        {if $sMenuItemSelect=='log'}
            <li {if $sMenuSubItemSelect=='good'}class="active"{/if}><a href="{router page='personal_blog'}">{$aLang.blog_menu_personal_good}</a></li>
            <li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
                <a href="{router page='personal_blog'}newall/" title="{$aLang.blog_menu_top_period_all}">{$aLang.blog_menu_personal_new}</a>
                {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new" title="{$aLang.blog_menu_top_period_24h}">+{$iCountTopicsPersonalNew}</a>{/if}
            </li>
            <li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{router page='personal_blog'}discussed/">{$aLang.blog_menu_personal_discussed}</a></li>
            <li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{router page='personal_blog'}top/">{$aLang.blog_menu_personal_top}</a></li>
            {hook run='menu_blog_log_item'}
        {else}
            <li {if $sMenuSubItemSelect=='new'}class="active"{/if}>
                <a href="{router page='index'}newall/" title="{$aLang.blog_menu_top_period_all}">{$aLang.blog_menu_all_new}</a>
                {if $iCountTopicsNew>0}<a href="{router page='index'}new/" class="new" title="{$aLang.blog_menu_top_period_24h}">+{$iCountTopicsNew}</a>{/if}
            </li>
            <li {if $sMenuSubItemSelect=='discussed'}class="active"{/if}><a href="{router page='index'}discussed/">{$aLang.blog_menu_all_discussed}</a></li>
            <li {if $sMenuSubItemSelect=='top'}class="active"{/if}><a href="{router page='index'}top/">{$aLang.blog_menu_all_top}</a></li>
        {/if}

        {*<li {if $sMenuItemSelect=='index'}class="active"{/if}>
            <a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a> {if $iCountTopicsNew>0}<a href="{router page='index'}newall/" class="new">+{$iCountTopicsNew}</a>{/if}
                <ul class="sub-menu">

                    {hook run='menu_blog_index_item'}
                </ul>
        </li>


        <li {if $sMenuItemSelect=='blog'}class="active"{/if}>
            <a href="{router page='blog'}">{$aLang.blog_menu_collective}</a> {if $iCountTopicsCollectiveNew>0}<a href="{router page='blog'}new/" class="new">+{$iCountTopicsCollectiveNew}</a>{/if}
                <ul class="sub-menu">


                    {hook run='menu_blog_blog_item'}
                </ul>
        </li>

        <li {if $sMenuItemSelect=='log'}class="active"{/if}>
            <a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a> {if $iCountTopicsPersonalNew>0}<a href="{router page='personal_blog'}new/" class="new">+{$iCountTopicsPersonalNew}</a>{/if}
                <ul class="sub-menu">

                </ul>
        </li>
*}

       {* {if $oUserCurrent && $sMenuItemSelect=='index'}

            <li {if $sMenuItemSelect=='feed'}class="active"{/if}>
                <a href="{router page='feed'}">{$aLang.userfeed_title}</a>
            </li>
        {/if}*}

      {*  <li {if $sMenuItemSelect=='top'}class="active"{/if}>
            <a href="{router page='top'}">{$aLang.blog_menu_top}</a>
                <ul class="sub-menu">
                    <li {if $sPeriodSelectCurrent=='1'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=1">{$aLang.blog_menu_top_period_24h}</a></li>
                    <li {if $sPeriodSelectCurrent=='7'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=7">{$aLang.blog_menu_top_period_7d}</a></li>
                    <li {if $sPeriodSelectCurrent=='30'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=30">{$aLang.blog_menu_top_period_30d}</a></li>
                    <li {if $sPeriodSelectCurrent=='all'}class="active"{/if}><a href="{$sPeriodSelectRoot}?period=all">{$aLang.blog_menu_top_period_all}</a></li>
                </ul>
        </li>*}
{*


        {hook run='menu_blog'}
    </ul>
</div>*}