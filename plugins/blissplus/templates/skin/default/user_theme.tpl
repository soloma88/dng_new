{assign var="color" value=$oConfig->get('plugin.blissplus.theme.usercolor')}
<style>

    /*base.css */
    .link {
        color: {$color};
    }
    a:hover {
        color: {$color};
    }

    a.link-dashed:hover {
        border-color: {$color};
    }
    a.link-dotted:hover {
        border-color: {$color}; }
    #header .new-messages i{
        color: {$color};
    }
    .dropdown-user .write:hover{
        color: {$color};
    }
    .dropdown-user-menu li a:hover   {
        color: {$color};
    }
    .dropdown-user-menu li a:hover  i {
        color: {$color};
    }
    .footer-list a:hover {
        color: {$color};
    }
    /*blocks.css */
    .block footer a:hover {
        color: {$color};
    }
    .block .nav-pills li.active {
        background: {$color};
    }
    .block .nav-pills li a:hover {
        color: {$color};
        border-color: {$color};
    }
    .block .nav-pills li a:hover {
        color: {$color};
        border-color: {$color};
    }
    .block .block-update:hover {
        color: {$color};
    }
    .button.button-actions.followed {
        background: {$color};
        border-color: {$color};
    }
    .button.button-actions.followed {
        background: {$color};
        border-color: {$color};
    }
     .nav.nav-profile li a:hover 	{
         border-color: {$color};
     }
    .nav.nav-profile li.active a	{
        background: {$color};
        border-color:{$color};
        color: #fff;
    }
     .nav.nav-profile li.active a	{
         background: {$color};
         border-color:{$color};
         color: #fff;
     }
     .block.block-type-blog h2 a:hover {
         color: {$color};
     }
     .block.block-type-profile-stream li a:hover {
         color: {$color};
     }


           /*buttons.css */

    .button:hover {
         border-color: {$color};
     }
    .button.button-primary 			{
        background: {$color};
    }
    .button.button-primary:hover 	{
        border-color: {$color};
    }
    .button.button-actions:hover {
        border-color: {$color};
    }
    .button.button-action:hover {
        background-color: {$color};
    }
    .button.button-ajax:hover {
        border-color: {$color};
    }
    .button.button-ajax.active {
        background: {$color};
        border-color: {$color};
    }
    .button.button-ajax.active {
        background: {$color};
        border-color: {$color};
    }

    /*comments.css */
    .reply-header a:hover {
        border-color: {$color};
        color: {$color};
    }
    .reply-header a:hover {
        border-color: {$color};
        color: {$color};
    }


    /*common.css */
    .pagination ul li a:hover 		{ 
        border-color: {$color}; 
    }
    .pagination ul li.active span 	{ 
        background: {$color};
        border-color: {$color};
    }
    .pagination ul li.active span 	{ 
        background: {$color};
        border-color: {$color};
    }
    .toolbar section a:hover	{ 
        background: {$color}; 
    }
    .toolbar .toolbar-update .update-comments.active    { 
        background-color: {$color};
    }
    .search-item.search-item-abc ul li a:hover 			{ 
        color: {$color} 
    }
    .blogs-item-list .blog-item h2 a:hover{    
        color: {$color};
    }
    #tab-wrapper a.active {
        background: {$color};
        border-color: {$color};
    }
    
    
    /*grid.css */
    #nav 		{

    }
    #footer 	{
        border-top: 5px solid {$color};
    }
    
   /*navs.css*/
    .nav.nav-pills li:hover 	{ 
        border-color: {$color};
    }
    .nav.nav-pills li.active 	{ 
        background: {$color};
        border-color:{$color};
    }
    .nav.nav-pills li.active 	{ 
        background: {$color};
        border-color:{$color};
    }

    .nav.nav-user li a:hover 				{ 
        color: {$color};  
    }
    .nav.nav-filter li .sub-menu li a:hover { 
        color: {$color}
    }
    .nav.nav-filter li .sub-menu li.active a{ 
        color: {$color}
    }
    .nav.nav-main li.active a 		{ 
        background-color: {$color};
    }
    .nav.nav-main li a:hover { 
        color: {$color};
    }
        
    
           /*new.css */
    .topic-mosaic .title-topic {  
        border-top: 2px solid {$color}; 
    }
	.topic-tile  .topic-title a:hover       {
        color: {$color};
    }
    .topic-tile .topic-info .topic-blog:hover       { 
        color: {$color};
    }
    .topic-tile .topic-content footer .topic-info li a:hover {  
        color: {$color};
    }
    /* profile.css */
	.btn-trigger:hover { 
        border-color: {$color}; 
    }
    /*tables.css */
    
	.table th a:hover { 
        color: {$color};
        border-color: {$color}; 
    }
	 .table th a:hover { 
         color: {$color};
         border-color: {$color};
     }
	 .table.table-users .action li a.followed { 
         background: {$color};
         border-color: {$color};
     }
	 .table.table-users .action li a.followed { 
         background: {$color};
         border-color: {$color};
     }
     
     
    /*topic.css */

	.topic .topic-header .topic-title a:hover       { 
        color: {$color};
    }
    .topic .topic-header .topic-info .topic-blog:hover       { 
        color: {$color};
    }
    .topic .topic-footer .topic-info li a:hover { 
        color: {$color};
    }

</style>