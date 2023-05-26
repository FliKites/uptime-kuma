SET foreign_key_checks = 0;
START TRANSACTION;
CREATE TABLE IF NOT EXISTS `heartbeat`(
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `important` TINYINT NOT NULL DEFAULT 0,
  `monitor_id` INT NOT NULL,
  `status` SMALLINT NOT NULL,
  `msg` TEXT,
  `time` DATETIME NOT NULL,
  `ping` INT,
  `duration` INT NOT NULL DEFAULT 0,
  FOREIGN KEY (`monitor_id`) REFERENCES `monitor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `user`(
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `username` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255),
  `active` TINYINT NOT NULL DEFAULT 1,
  `timezone` VARCHAR(150)
);
CREATE TABLE IF NOT EXISTS `setting`(
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `key` VARCHAR(200) NOT NULL UNIQUE,
  `value` VARCHAR(200),
  `type` VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS `notification`(
  `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name` VARCHAR(255),
  `config` VARCHAR(255),
  `active` TINYINT NOT NULL DEFAULT 1,
  `user_id` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS `monitor_notification`(
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `monitor_id` INT NOT NULL,
  `notification_id` INT NOT NULL,
  FOREIGN KEY (`monitor_id`) REFERENCES `monitor`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`notification_id`) REFERENCES `notification`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `monitor` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150),
  `active` TINYINT NOT NULL DEFAULT 1,
  `user_id` INT,
  `interval` INT NOT NULL DEFAULT 20,
  `url` TEXT,
  `type` VARCHAR(20),
  `weight` INT DEFAULT 2000,
  `hostname` VARCHAR(255),
  `port` INT,
  `created_date` TIMESTAMP,
  `keyword` VARCHAR(255),
  `maxretries` INT NOT NULL DEFAULT 0,
  FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX `monitor_id` ON `heartbeat`(`monitor_id`);
CREATE INDEX `important` ON `heartbeat`(`important`);
CREATE INDEX `monitor_notification_index` ON `monitor_notification`(`monitor_id`, `notification_id`);
CREATE INDEX `user_id` ON `monitor`(`user_id`);
COMMIT;
SET foreign_key_checks = 1;