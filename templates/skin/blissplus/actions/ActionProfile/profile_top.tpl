{assign var="oSession" value=$oUserProfile->getSession()}
<div class="profile">
	{hook run='profile_top_begin' oUserProfile=$oUserProfile}
	
	<img src="{$oUserProfile->getProfileAvatarPath(100)}" alt="avatar" title="{$oUserProfile->getLogin()}" class="avatar" itemprop="photo" />

	<div id="vote_area_user_{$oUserProfile->getId()}" class="vote {if $oUserProfile->getRating()>=0}vote-count-positive{else}vote-count-negative{/if} {if $oVote} voted {if $oVote->getDirection()>0}voted-up{elseif $oVote->getDirection()<0}voted-down{/if}{/if}">
        <a href="#" class="vote-down" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"><i class="fa fa-minus-square"></i></a>
        <div id="vote_total_user_{$oUserProfile->getId()}" class="vote-count count" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{if $oUserProfile->getRating() > 0}+{/if}{$oUserProfile->getRating()}</div>
        <a href="#" class="vote-up" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"><i class="fa fa-plus-square"></i></a>

        <div class="vote-label">{$aLang.user_rating}</div>
    </div>
	
	<div class="strength">

		<div class="count" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
        <div class="vote-label">{$aLang.user_skill}</div>
	</div>
	
	<h2 class="page-header user-login word-wrap {if $oUserProfile->isOnline()}status-online{/if} {if !$oUserProfile->getProfileName()}no-user-name{/if}" itemprop="nickname"><span>{$oUserProfile->getLogin()}</span></h2>


	{if $oUserProfile->getProfileName()}
		<p class="user-name" itemprop="name">{$oUserProfile->getProfileName()|escape:'html'}</p>
	{/if}
    <p class="session">
        <span>{$aLang.profile_date_last}:</span>
        <strong>{date_format date=$oSession->getDateLast()}</strong>
    </p>

    {hook run='profile_top_end' oUserProfile=$oUserProfile}
</div>