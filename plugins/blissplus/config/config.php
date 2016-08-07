<?php

/* Theme */
$config['themes'] = 'user';
$config['theme']['usercolor'] = '#54c0d1'; // задать свой цвет (#54c0d1)
/*Вид топика [tile, mosaic(только на главной), оставить пустым - обычный]*/
$config['topic_style'] = 'mosaic'; //default, tile, mosaic

/*количество топиков на одну страницу в нормальном отображении*/
if($config['topic_style'] == 'mosaic'){
    $config['topic_count_page']=9;
}else{
    $config['topic_count_page']=10;
}

/*Блок Активность в профиле - количество пунктов  */
$config['count_steam']=5;

/* Картинка в навигации*/
$config['header_bg']=true; // true - включить,  false для отключения функции
$config['header_height'] = 300; // указать свою высоту в пикселях (загрузите свое изображение в папку templates/skin/bliss/images/bg.png)


/*Размеры превью*/
$config['size_images_preview']=array(
    array(
        'w' => 335,
        'h' => 209,
        'crop' => true,
    ),
    array(
        'w' => 254,
        'h' => 254,
        'crop' => true,
    ),
    array(
        'w' => 516,
        'h' => 254,
        'crop' => true,
    )
);
Config::Set('block.rule_blog', array(
    'action'  => array( 'blog' => array('{blog}') ),
    'blocks'  => array( 'right' => array() ),
    'clear' => true,
));

//Config::Set('block.rule_blog', array(
//    'action'  => array( 'blog' => array('{blog}') ),
//    'blocks'  => array( 'right' => array('actions/ActionBlog/sidebar.tpl') ),
//    'clear' => true,
//));


/*ниже не трогать*/
if (Config::Get('plugin.mainpreview.load')) {
    Config::Set('plugin.mainpreview.size_images_preview',array_merge(Config::Get('plugin.mainpreview.size_images_preview'),$config['size_images_preview']));
    /** минимальные размеры */
    Config::Set('plugin.mainpreview.preview_minimal_size_width',335);
    Config::Set('plugin.mainpreview.preview_minimal_size_height',209);
}

Config::Set('module.topic.per_page',$config['topic_count_page']);


return $config;
?>