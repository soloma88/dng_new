<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/
/**
 * Настройки для локального сервера.
 * Для использования - переименовать файл в config.local.php
 */

/**
 * Настройка базы данных
 */
$config['db']['params']['host'] = 'holyblog.mysql.ukraine.com.ua';
$config['db']['params']['port'] = '3306';
$config['db']['params']['user'] = 'holyblog_dngnew';
$config['db']['params']['pass'] = '49lz56xd';
$config['db']['params']['type']   = 'mysql';
$config['db']['params']['dbname'] = 'holyblog_dngnew';
$config['db']['table']['prefix'] = '';

$config['path']['root']['web'] = 'http://demo.dng.com.ua/';
$config['path']['root']['server'] = '/home/holyblog/dng.com.ua/demo/';
$config['path']['offset_request_url'] = '0';
$config['db']['tables']['engine'] = 'InnoDB';
$config['view']['name'] = 'Церковь "Новое Поколение" г.Днепропетровск';
$config['view']['description'] = 'Христианская церковь "Новое Поколение" г.Днепропетровск';
$config['view']['keywords'] = 'церковь, новое поколение, христианская, днепропетровск, Иисус, Бог';
$config['view']['skin'] = 'blissplus';
$config['sys']['mail']['from_email'] = 'soloma88@gmail.com';
$config['sys']['mail']['from_name'] = 'Церковь "Новое Поколение"';
$config['general']['close'] = false;
$config['general']['reg']['activation'] = false;
$config['general']['reg']['invite'] = true;
$config['lang']['current'] = 'russian';
$config['lang']['default'] = 'russian';
return $config;
?>
