var ls = ls || {};
ls.plugin = ls.plugin || {};


ls.plugin.blissplus = (function ($) {

    this.createTopicDescription = function(item) {
        bottom = -(item.outerHeight()-$('.title-topic', item).outerHeight() )+38;
        item.css('bottom', bottom)
        item.parent().hover(
            function () {
                item.addClass('hover')
                $('.topic-content', this).css('bottom', 0)
            },
            function () {
                item.removeClass('hover')
                bottom = -($('.topic-content', this).outerHeight()-$('.topic-content .title-topic', this).outerHeight() )+38;
                $('.topic-content', this).css('bottom', bottom)
            }
        );
    };

    this.allowLoading=true; // разрешить автоподгрузку
    this.aAjaxUrl = ''; // урл из экшена
	this.currentPage=1;    // количество страниц
    this.bIsLoading=false;  // знает происходит лт загрузка топиков или нет
	
    /**/ 
    this.ajaxLoadMoreTopic = function() {
		if (this.bIsLoading) return false; // Если уже идет загрузка то прерываем функцию
		if (!this.aAjaxUrl) return false;  // Если не передан урл то также прерываем загрузку
        /**
         * начинаем загрузку
         */
        $('#get-more-topic').addClass('active');
        this.bIsLoading=true;

		var url = this.aAjaxUrl+'/page'+(this.currentPage+1)+'/';
		ls.ajax(url, {aLoadAjax: true}, function(data) {
			if (data.bStateError) {
                /**
                 * Ошибка!!!
                 */
				ls.msg.error(null, data.sMsg);
				this.ajaxLoadStop();
			} else {
				if (data.iCount) {
                    $content=$('<div>'+data.result+'</div>').find('#topic-list');
					$('#topic-list').append($content)
                    /*$('.topic-mosaic .topic-content').each(function(){
                        ls.plugin.bliss.createTopicDescription($(this));
                    });*/
                    this.ajaxLoadStop();
					this.currentPage++;
				} else {

                    $('#get-more-topic').hide();
					this.allowLoading=false;  /*запрещаем дальнейшую загрузку*/
					this.ajaxLoadStop();
				}
			}

		}.bind(this));
		return false;
	};

    /**
     * Останавливает загрузку
     */
	this.ajaxLoadStop = function() {
        $('#get-more-topic').removeClass('active');
		this.bIsLoading=false;
	};




    this.viewStreamBlock = function(item) {
		var pos 	= $(item).offset();  /* кнопка */
        var menu = $('#dropdown-stream')
        $('#dropdown-stream').css({ 'left': pos.left-189, 'top': pos.top+48}).toggle();
        if(menu.css('display') == 'block'){
            $('#sidebar-view').addClass('active')
        }else{
            $('#sidebar-view').removeClass('active')
        }
		return false;
	};
	return this;
}).call(ls.plugin.bliss || {},jQuery);