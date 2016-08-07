jQuery(document).ready(function($){
	// Хук начала инициализации javascript-составляющих шаблона
	ls.hook.run('ls_template_init_start',[],window);
	
	$('html').removeClass('no-js');
	
	// Определение браузера
	if ($.browser.opera) {
		$('body').addClass('opera opera' + parseInt($.browser.version));
	}
	if ($.browser.mozilla) {
		$('body').addClass('mozilla mozilla' + parseInt($.browser.version));
	}
	if ($.browser.webkit) {
		$('body').addClass('webkit webkit' + parseInt($.browser.version));
	}
	if ($.browser.msie) {
		$('body').addClass('ie');
		if (parseInt($.browser.version) > 8) {
			$('body').addClass('ie' + parseInt($.browser.version));
		}
	}
	 
	// Всплывающие окна
	$('#window_login_form').jqm();
	$('#blog_delete_form').jqm({trigger: '#blog_delete_show'});
	$('#add_friend_form').jqm({trigger: '#add_friend_show'});
	$('#window_upload_img').jqm();
	$('#userfield_form').jqm();
	$('#favourite-form-tags').jqm();
	$('#modal_write').jqm({trigger: '#modal_write_show'});
	$('#foto-resize').jqm({modal: true});
	$('#avatar-resize').jqm({modal: true});
	$('#userfield_form').jqm({toTop: true}); 
	$('#photoset-upload-form').jqm({trigger: '#photoset-start-upload'});

	$('.js-registration-form-show').click(function(){
		if (ls.blocks.switchTab('registration','popup-login')) {
			$('#window_login_form').jqmShow();
		} else {
			window.location=aRouter.registration;
		}
		return false;
	});

	$('.js-login-form-show').click(function(){
		if (ls.blocks.switchTab('login','popup-login')) {
			$('#window_login_form').jqmShow();
		} else {
			window.location=aRouter.login;
		}
		return false;
	});
	
	// Datepicker
	 /**
	  * TODO: навесить языки на datepicker
	  */
	$('.date-picker').datepicker({ 
		dateFormat: 'dd.mm.yy',
		dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
		monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
		firstDay: 1
	});
	
	
	// Поиск по тегам
	$('.js-tag-search-form').submit(function(){
		window.location = aRouter['tag']+encodeURIComponent($(this).find('.js-tag-search').val())+'/';
		return false;
	});
	
	
	// Автокомплит
	ls.autocomplete.add($(".autocomplete-tags-sep"), aRouter['ajax']+'autocompleter/tag/', true);
	ls.autocomplete.add($(".autocomplete-tags"), aRouter['ajax']+'autocompleter/tag/', false);
	ls.autocomplete.add($(".autocomplete-users-sep"), aRouter['ajax']+'autocompleter/user/', true);
	ls.autocomplete.add($(".autocomplete-users"), aRouter['ajax']+'autocompleter/user/', false);

	
	// Скролл
	$(window)._scrollable();

    /**
     * Toolbar
     */
    toolbarPos();

    $(window).resize(function(){
        toolbarPos();
    });

    $(window).scroll(function(){
        if ($(document).width() <= 1100) {
            toolbarPos();
        }
    });

    function toolbarPos() {

        var $=jQuery;
        if ($('#toolbar section').length) {
            if ($(document).width() <= 1100) {
                if (!$('#container').hasClass('no-resize')) {
                    $('#container').addClass('toolbar-margin');
                }
                $('#toolbar').css({'position': 'absolute', 'left': $('#wrapper').offset().left + $('#wrapper').outerWidth() + 20, 'top' : $(document).scrollTop() + $('#content-wrapper').offset().top, 'display': 'block'});
            } else {

                $('#container').removeClass('toolbar-margin');
                $('#toolbar').css({'position': 'fixed', 'left': $('#wrapper').offset().left + $('#wrapper').outerWidth() + 20, 'top': $('#content-wrapper').offset().top, 'display': 'block'});
            }
        }
    };


	
	// Тул-бар топиков
	ls.toolbar.topic.init();
	// Кнопка "UP"
	ls.toolbar.up.init();

	
	// Всплывающие сообщения
	if (ls.registry.get('block_stream_show_tip')) {
		$('.js-title-comment, .js-title-topic').poshytip({
			className: 'infobox-yellow',
			alignTo: 'target',
			alignX: 'left',
			alignY: 'center',
			offsetX: 10,
			liveEvents: true,
			showTimeout: 1000
		});
	}

	$('.js-title-talk').poshytip({
		className: 'infobox-yellow',
		alignTo: 'target',
		alignX: 'left',
		alignY: 'center',
		offsetX: 10,
		liveEvents: true,
		showTimeout: 500
	});

	$('.js-infobox-vote-topic').poshytip({
		content: function() {
			var id = $(this).attr('id').replace('vote_total_topic_','vote-info-topic-');
			return $('#'+id).html();
		},
		className: 'infobox-standart',
		alignTo: 'target',
		alignX: 'center',
		alignY: 'top',
		offsetX: 2,
		liveEvents: true,
		showTimeout: 100
	});
	
	$('.js-tip-help').poshytip({
		className: 'infobox-standart',
		alignTo: 'target',
		alignX: 'right',
		alignY: 'center',
		offsetX: 5,
		liveEvents: true,
		showTimeout: 500
	});

	$('.js-infobox').poshytip({
		className: 'infobox-standart',
		liveEvents: true,
		showTimeout: 300
	});

	// подсветка кода
	prettyPrint();
	
	// эмуляция border-sizing в IE
	var inputs = $('input.input-text, textarea');
	ls.ie.bordersizing(inputs);
	
	// эмуляция placeholder'ов в IE
	inputs.placeholder();

	// инизиализация блоков
	ls.blocks.init('stream',{group_items: true, group_min: 3});
	ls.blocks.init('blogs');
	ls.blocks.initSwitch('tags');
	ls.blocks.initSwitch('upload-img');
	ls.blocks.initSwitch('favourite-topic-tags');
	ls.blocks.initSwitch('popup-login');

	// комментарии
	ls.comments.options.folding = false;
	ls.comments.init();

	// избранное
	ls.hook.add('ls_favourite_toggle_after',function(idTarget,objFavourite,type,params,result){
		$('#fav_count_'+type+'_'+idTarget).text((result.iCount>0) ? result.iCount : '');
	});

	/****************
	 * TALK
	 */

	// Добавляем или удаляем друга из списка получателей
	$('#friends input:checkbox').change(function(){
		ls.talk.toggleRecipient($('#'+$(this).attr('id')+'_label').text(), $(this).attr('checked'));
	});

	// Добавляем всех друзей в список получателей
	$('#friend_check_all').click(function(){
		$('#friends input:checkbox').each(function(index, item){
			ls.talk.toggleRecipient($('#'+$(item).attr('id')+'_label').text(), true);
			$(item).attr('checked', true);
		});
		return false;
	});

	// Удаляем всех друзей из списка получателей
	$('#friend_uncheck_all').click(function(){
		$('#friends input:checkbox').each(function(index, item){
			ls.talk.toggleRecipient($('#'+$(item).attr('id')+'_label').text(), false);
			$(item).attr('checked', false);
		});
		return false;
	});

	// Удаляем пользователя из черного списка
	$("#black_list_block").delegate("a.delete", "click", function(){
		ls.talk.removeFromBlackList(this);
		return false;
	});

	// Удаляем пользователя из переписки
	$("#speaker_list_block").delegate("a.delete", "click", function(){
		ls.talk.removeFromTalk(this, $('#talk_id').val());
		return false;
	});


	// Help-tags link
	$('.js-tags-help-link').click(function(){
		var target=ls.registry.get('tags-help-target-id');
		if (!target || !$('#'+target).length) {
			return false;
		}
		target=$('#'+target);
		if ($(this).data('insert')) {
			var s=$(this).data('insert');
		} else {
			var s=$(this).text();
		}
		$.markItUp({target: target, replaceWith: s});
		return false;
	});
	
	
	// Фикс бага с z-index у встроенных видео
	$("iframe").each(function(){
		var ifr_source = $(this).attr('src');

		if(ifr_source) {
			var wmode = "wmode=opaque";
				
			if (ifr_source.indexOf('?') != -1) 
				$(this).attr('src',ifr_source+'&'+wmode);
			else 
				$(this).attr('src',ifr_source+'?'+wmode);
		}
	});
    this.newFollowToggle = function(obj, iUserId) {
        if ($(obj).hasClass('followed')) {
            ls.stream.unsubscribe(iUserId);
            $(obj).toggleClass('followed');
        } else {
            ls.stream.subscribe(iUserId);
            $(obj).toggleClass('followed');
        }
        return false;
    };

    this.toggleBlogInfo = function() {
        $('#blog-more-content').slideToggle();
        var more = $('#blog-more');
        more.toggleClass('expanded');

        if(more.hasClass('expanded')) {
            more.html('<i class="icon-bliss-collapse-alt"></i> ');
        } else {
            more.html('<i class="icon-bliss-expand-alt"></i>');
        }

        return false;
    };

    this.toggleProfile = function() {
        $('#profile-contact').slideToggle();
        var more = $('#profile-contact-trigger');
        more.toggleClass('expanded');

        if(more.hasClass('expanded')) {
            more.html(ls.lang.get('profile_trigger_close')+'<i class="icon-bliss-level-up">');
        } else {
            more.html(ls.lang.get('profile_trigger_open')+'<i class="icon-bliss-level-down">');
        }


        return false;
        /*/ Dropdown
         var dp 		= $('#dropdown-user');
         if (!dp.length) {
         return;
         }
         var trigger = $('#profile-contact-trigger');
         var menu 	= $('#profile-contact');
         //var pos 	= $('#dropdown-user').offset();

         menu.css({'display': 'none' });

         trigger.click(function(){
         menu.slideToggle();
         dp.toggleClass('opened');
         return false;
         });

         menu.find('a').click(function(){
         dp.removeClass('opened');
         trigger.find('a').text( $(this).text() );
         menu.slideToggle();
         });

         // Hide menu
         $(document).click(function(){
         dp.removeClass('opened');
         menu.slideUp();
         });
         $(window).resize(function(){
         menu.css({ 'left': $('#dropdown-user').offset().left });
         });*/
    };

    (function(){
        var search_show = $('#search-header-show');
        if (!search_show.length) {
            return;
        }
        var search_form = $('#search-header-form');

        search_show.click(function(){
            search_form.toggle().find('.input-text').focus();
            $(this).toggle();
            return false;
        });

        $(document).click(function(){
            if (search_form.find('.input-text').val() == '') {
                search_form.hide();
                search_show.show();
            }
        });

        $('body').on('click', '#search-header-form', function(e) {
            e.stopPropagation();
        });
    })();




    // Хук конца инициализации javascript-составляющих шаблона
	ls.hook.run('ls_template_init_end',[],window);
});