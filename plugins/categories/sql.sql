CREATE TABLE IF NOT EXISTS `prefix_categories` (
      `category_id` int(11) unsigned NOT NULL auto_increment,
      `path` varchar(100) NOT NULL,
      `name` varchar(100) NOT NULL,
      `description` text character set utf8 NOT NULL,
      PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


