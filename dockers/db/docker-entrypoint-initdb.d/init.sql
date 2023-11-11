CREATE DATABASE IF NOT EXISTS `sqli_app_development`;
GRANT ALL ON sqli_app_development.* TO 'sqli_app_user'@'%';

CREATE DATABASE IF NOT EXISTS `sqli_app_test`;
GRANT ALL ON sqli_app_test.* TO 'sqli_app_user'@'%';
