			        {hook run='content_end'}
		    </div> <!-- /content -->
        </div><!-- /content-wrapper -->

		{if !$noSidebar && $sidebarPosition != 'left'}
			{include file='sidebar.tpl'}
		{/if}
	</div> <!-- /wrapper -->

	


</div> <!-- /container -->
<footer id="footer">
    <div class="footer-top">
        <div class="container" >

            <div class="footer-block">
                    <header>Мы в социальных сетях</header>
                    <div>
                        <ul class="social">
                            <li class="google">   <a href="#"></a> </li>
                            <li class="facebook"> <a href="#"></a> </li>
                            <li class="vk">       <a href="#"></a> </li>
                            <li class="twitter">  <a href="#"></a> </li>
                            <li class="youtube">  <a href="#"></a> </li>
                        </ul>
                    </div>
             </div>

            <div class="footer-block">
                    <header>Информация</header>
                    <div>
                        <ul class="footer-list">
                            <li><a href="#">О проекте</a></li>
                            <li><a href="#">Правила</a></li>
                            <li><a href="#">Реклама</a></li>
                            <li><a href="#">Помощь</a></li>
                        </ul>
                    </div>
            </div>


        </div>
    </div>

    <div class="footer-bottom">
        {hook run='footer_end'}
    </div>
</footer>
{include file='toolbar.tpl'}

{hook run='body_end'}

</body>
</html>