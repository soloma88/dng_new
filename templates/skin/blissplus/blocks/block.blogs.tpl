<div class="block block-type-blogs" id="block_blogs">
    <div class="block-inner">
    <header class="block-header">
		<h3>{$aLang.block_blogs}</h3>
		<div class="block-update js-block-blogs-update"></div>
	</header>
	
	
	<div class="block-content">
		<ul class="nav nav-pills js-block-blogs-nav">
            {if $sAction!='profile'}<li class="active js-block-blogs-item" data-type="top"><a href="#">{$aLang.block_blogs_top}</a></li>{/if}
			{if $oUserCurrent}
				<li class="js-block-blogs-item" data-type="joinProfile"><a href="#">{$aLang.block_blogs_join}</a></li>
				<li class="js-block-blogs-item" data-type="self"><a href="#">{$aLang.block_blogs_self}</a></li>
			{/if}
		</ul>
		
		{$aWall}
		<div class="js-block-blogs-content">
			{$sBlogsTop}
		</div>

		
		<footer>
			<a href="{router page='blogs'}">{$aLang.block_blogs_all}</a>
		</footer>

    </div>
    </div>
</div>
