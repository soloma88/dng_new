{if $menuContent}
	{if in_array($menuContent,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menuContent.tpl"}{/if}
{/if}