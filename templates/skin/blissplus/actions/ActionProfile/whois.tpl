{assign var="sMenuItemSelect" value='profile'}
{include file='header.tpl' menu='people'}


{assign var="oVote" value=$oUserProfile->getVote()}
{assign var="oGeoTarget" value=$oUserProfile->getGeoTarget()}



{include file='actions/ActionProfile/profile_top.tpl'}
<script type="text/javascript">
    jQuery(function($){
        ls.lang.load({lang_load name="profile_trigger_close,profile_trigger_open"});
    });
</script>



{if $oUserProfile->getProfileAbout()}
    <div class="profile-info-about">
        <h3>{$aLang.profile_about}</h3>
        {$oUserProfile->getProfileAbout()}
    </div>
{/if}



<div class="wrapper">
    <div class="profile-left">
        {assign var="aUserFieldValues" value=$oUserProfile->getUserFieldValues(true,array(''))}
        <h2 class="header-profile"><span>{$aLang.profile_privat}</span></h2>

        {*****************  Личное и активность  *******************
                                   ***
        ************************* Личное **************************}
        <ul class="profile-dotted-list">
            {if $oUserProfile->getProfileSex()!='other'}
                <li>
                    <span>{$aLang.profile_sex}:</span>
                    <strong>
                        {if $oUserProfile->getProfileSex()=='man'}
                            {$aLang.profile_sex_man}
                        {else}
                            {$aLang.profile_sex_woman}
                        {/if}
                    </strong>
                </li>
            {/if}


            {if $oUserProfile->getProfileBirthday()}
                <li>
                    <span>{$aLang.profile_birthday}:</span>
                    <strong>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y"}</strong>
                </li>
            {/if}


            {if $oGeoTarget}
                <li>
                    <span>{$aLang.profile_place}:</span>
                    <strong itemprop="address" itemscope itemtype="http://data-vocabulary.org/Address">
                        {if $oGeoTarget->getCountryId()}
                            <a href="{router page='people'}country/{$oGeoTarget->getCountryId()}/" itemprop="country-name" class="link">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oGeoTarget->getCityId()},{/if}
                        {/if}

                        {if $oGeoTarget->getCityId()}
                            <a href="{router page='people'}city/{$oGeoTarget->getCityId()}/" class="link" itemprop="locality">{$oUserProfile->getProfileCity()|escape:'html'}</a>
                        {/if}
                    </strong>
                </li>
            {/if}

            {if $aUserFieldValues}
                {foreach from=$aUserFieldValues item=oField}
                    <li>
                        <span><i class="icon-contact icon-contact-{$oField->getName()}"></i> {$oField->getTitle()|escape:'html'}:</span>
                        <strong>{$oField->getValue(true,true)}</strong>
                    </li>
                {/foreach}
            {/if}

            {hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}

        {hook run='profile_whois_item_after_privat' oUserProfile=$oUserProfile}

            {***********************************************
            ************   Активность **********************}
            {if $oConfig->GetValue('general.reg.invite') and $oUserInviteFrom}
                <li>
                    <span>{$aLang.profile_invite_from}:</span>
                    <strong>
                        <a href="{$oUserInviteFrom->getUserWebPath()}">{$oUserInviteFrom->getLogin()}</a>&nbsp;
                    </strong>
                </li>
            {/if}


            {if $oConfig->GetValue('general.reg.invite') and $aUsersInvite}
                <li>
                    <span>{$aLang.profile_invite_to}:</span>
                    <strong>
                        {foreach from=$aUsersInvite item=oUserInvite}
                            <a href="{$oUserInvite->getUserWebPath()}">{$oUserInvite->getLogin()}</a>&nbsp;
                        {/foreach}
                    </strong>
                </li>
            {/if}


            {if $aBlogsOwner}
                <li>
                    <span>{$aLang.profile_blogs_self}:</span>
                    <strong>
                        {foreach from=$aBlogsOwner item=oBlog name=blog_owner}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_owner.last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}


            {if $aBlogAdministrators}
                <li>
                    <span>{$aLang.profile_blogs_administration}:</span>
                    <strong>
                        {foreach from=$aBlogAdministrators item=oBlogUser name=blog_user}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}


            {if $aBlogModerators}
                <li>
                    <span>{$aLang.profile_blogs_moderation}:</span>
                    <strong>
                        {foreach from=$aBlogModerators item=oBlogUser name=blog_user}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if}


            {*if $aBlogUsers}
                <li>
                    <span>{$aLang.profile_blogs_join}:</span>
                    <strong>
                        {foreach from=$aBlogUsers item=oBlogUser name=blog_user}
                            {assign var="oBlog" value=$oBlogUser->getBlog()}
                            <a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
                        {/foreach}
                    </strong>
                </li>
            {/if*}


            {hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}


            <li>
                <span>{$aLang.profile_date_registration}:</span>
                <strong>{date_format date=$oUserProfile->getDateRegister()}</strong>
            </li>


            {if $oSession}
                <li>
                    <span>{$aLang.profile_date_last}:</span>
                    <strong>{date_format date=$oSession->getDateLast()}</strong>
                </li>
            {/if}
        </ul>





        {hook run='profile_whois_item_end' oUserProfile=$oUserProfile}
    </div>
    <!-- /profile-left -->


    {*********************************************
    *********   Кнопка получения контактов *******}
    {assign var="aUserFieldContactValuesAcc" value=$oUserProfile->getUserFieldValues(true,array('social'))}
    {assign var="aUserFieldContactValuesCnt" value=$oUserProfile->getUserFieldValues(true,array('contact'))}
    {if $aUserFieldContactValuesAcc|| $aUserFieldContactValuesCnt}
        <div id="profile-contact-trigger" onclick="return toggleProfile()" class="btn-trigger">{$aLang.profile_trigger_open} <i class="icon-bliss-level-down"></i> </div>
        {*********************************************
        *****           Контакты            **********}
        <div class="profile-contact" id="profile-contact" style="display: none;">

            {if $aUserFieldContactValuesCnt}
                <h2 class="header-profile"><span>{$aLang.profile_contacts}</span></h2>

                <ul class="profile-dotted-list profile-margin">
                    {foreach from=$aUserFieldContactValuesCnt item=oField}
                        <li>
                            <span>{$oField->getTitle()|escape:'html'}:</span>
                            <strong>{$oField->getValue(true,true)}</strong>
                        </li>
                    {/foreach}
                </ul>
            {/if}



            {if $aUserFieldContactValuesAcc}
                <h2 class="header-profile"><span>{$aLang.profile_social}</span></h2>

                <ul class="profile-dotted-list profile-margin">
                    {foreach from=$aUserFieldContactValuesAcc item=oField}
                        <li>
                            <span>   {$oField->getTitle()|escape:'html'}:          </span>
                            <strong> {$oField->getValue(true,true)} </strong>
                        </li>
                    {/foreach}
                </ul>
            {/if}

            {hook run='profile_whois_item' oUserProfile=$oUserProfile}
        </div>
    {/if}


    {* блок с друзьями *}
    {if $aUsersFriend}

        <div class="profile-margin">
            <h2 class="header-profile"><span><a href="{$oUserProfile->getUserWebPath()}friends/">{$aLang.profile_friends}</a><span>{$iCountFriendsUser}</span></span></h2>
            {include file='user_list_avatar.tpl' aUsersList=$aUsersFriend}
        </div>


    {/if}



    {**************************************************************************
    *********************       wall.tpl      *********************************
    ***************************************************************************}
    <div id="tab-wrapper" class="tab1">
        <ul class="nav nav-pills">
            <li class=" active"><a href="javascript:;" id="tab1" class="tabs">Стена</a></li>
            <li><a href="javascript:;" id="tab2" class="tabs">Посты</a></li>
        </ul>


        <div id="con_tab1" class="tabs active">{include file='actions/ActionProfile/wall.tpl'}</div>
        <div id="con_tab2" class="tabs">{include file='topic_list.tpl'}</div>
    </div>

<script>
    $(document).ready(function() {
        $('#tab-wrapper .nav.nav-pills li a').click(function() {
            var tab_id=$(this).attr('id');
            tabClick(tab_id)
        });
        function tabClick(tab_id) {
            if (tab_id != $('#tab-wrapper .nav.nav-pills li.active a').attr('id') ) {
                $('#tab-wrapper .tabs').parent().removeClass('active');
                $('#tab-wrapper .tabs').removeClass('active');

                $('#'+tab_id).parent().addClass('active');
                $('#con_' + tab_id).addClass('active');
            }
        }
    });

</script>


</div>




{include file='footer.tpl'}