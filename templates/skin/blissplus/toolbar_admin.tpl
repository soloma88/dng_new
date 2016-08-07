{if $oUserCurrent and $oUserCurrent->isAdministrator()}
<section class="toolbar-admin">
	<a href="{router page='admin'}" title="{$aLang.admin_title}">
		<i class="icon-bliss-crog"></i>
	</a>
</section>
{/if}