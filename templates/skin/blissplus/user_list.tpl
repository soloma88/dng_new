<table class="table table-users">
	{if $bUsersUseOrder}
		<thead>
			<tr>
				<th class="cell-name"><a href="{$sUsersRootPage}?order=user_login&order_way={if $sUsersOrder=='user_login'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_login'}class="{$sUsersOrderWay}"{/if}>{$aLang.user}</a></th>
				{*<th><a href="{$sUsersRootPage}?order=user_date_register&order_way={if $sUsersOrder=='user_date_register'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_date_register'}class="{$sUsersOrderWay}"{/if}>{$aLang.user_date_registration}</a></th>
				*}
                <th>&nbsp;</th>
                <th>{$aLang.user_date_last}</th>
                <th class="cell-skill"><a href="{$sUsersRootPage}?order=user_skill&order_way={if $sUsersOrder=='user_skill'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_skill'}class="{$sUsersOrderWay}"{/if}>{$aLang.user_skill}</a></th>
				<th class="cell-rating"><a href="{$sUsersRootPage}?order=user_rating&order_way={if $sUsersOrder=='user_rating'}{$sUsersOrderWayNext}{else}{$sUsersOrderWay}{/if}" {if $sUsersOrder=='user_rating'}class="{$sUsersOrderWay}"{/if}>{$aLang.user_rating}</a></th>
			</tr>
		</thead>
	{else}
		<thead>
			<tr>
				<th class="cell-name">{$aLang.user}</th>
                <th>&nbsp;</th>
				<th class="cell-date">{$aLang.user_date_last}</th>
				{*<th class="cell-date">{$aLang.user_date_registration}</th>*}
				<th class="cell-skill">{$aLang.user_skill}</th>
				<th class="cell-rating">{$aLang.user_rating}</th>
			</tr>
		</thead>
	{/if}

	<tbody>
		{if $aUsersList}
			{foreach from=$aUsersList item=oUserList}
				{assign var="oSession" value=$oUserList->getSession()}
				{assign var="oUserNote" value=$oUserList->getUserNote()}
				<tr>
					<td class="cell-name" style="display: block; position: relative; min-height: 48px;">
						<a href="{$oUserList->getUserWebPath()}"><img src="{$oUserList->getProfileAvatarPath(48)}" alt="avatar" title="{$oUserList->getLogin()}" class="avatar" /></a>
						<p class="username word-wrap"><a href="{$oUserList->getUserWebPath()}">{$oUserList->getLogin()}</a>
							{if $oUserNote}
								<i class="icon-comment js-infobox" title="{$oUserNote->getText()|escape:'html'}"></i>
							{/if}
						</p>
                        <p class="user-name">
                            {$oUserList->getProfileName()|escape:'html'}
                        </p>
                        {*if $oUserCurrent && $oUserCurrent->getId()!=$oUserList->getId()}
                            <ul class="action">
                                <li><a href="{router page='talk'}add/?talk_users={$oUserList->getLogin()}" class="button button-actions"><i class="icon-bliss-mini-msg"></i></a></li>
                                <li>
                                    <a href="#" onclick="newFollowToggle(this, {$oUserList->getId()}); return false;" class="{if $oUserList->isFollow()}followed{/if} button button-actions">
                                        {if $oUserList->isFollow()}
                                            <i class="icon-bliss-mini-share"></i>
                                        {else}
                                            <i class="icon-bliss-mini-share"></i>
                                        {/if}
                                    </a>
                                </li>
                            </ul>
                        {/if*}
					</td>
                    <td>
                        {if $oUserCurrent}
                            {*if $oUserNote}
                                <button type="button" class="button button-action button-action-note js-infobox" title="{$oUserNote->getText()|escape:'html'}"><i class="icon-synio-comments-green"></i></button>
                            {/if*}
                            <a href="{router page='talk'}add/?talk_users={$oUserList->getLogin()}"><button type="submit"  class="button button-action button-action-send-message"><i class="fa fa-envelope"></i><span>{$aLang.user_write_prvmsg}</span></button></a>
                        {/if}
                    </td>
					<td class="cell-date">{if $oSession}{date_format date=$oSession->getDateLast() format="d.m.y, H:i"}{/if}</td>
					{*<td class="cell-date">{date_format date=$oUserList->getDateRegister() format="d.m.y, H:i"}</td>*}
					<td class="cell-skill">{$oUserList->getSkill()}</td>
					<td class="cell-rating rating {if $oUserList->getRating() <0}negative{/if}">{$oUserList->getRating()}</td>
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="5">
					{if $sUserListEmpty}
						{$sUserListEmpty}
					{else}
						{$aLang.user_empty}
					{/if}
				</td>
			</tr>
		{/if}
	</tbody>
</table>


{include file='paging.tpl' aPaging=$aPaging}