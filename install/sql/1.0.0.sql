-- Copyright (C) 2013 Masood Ahmed

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.

DROP TABLE role;

ALTER TABLE `attendance` DROP `total`;
ALTER TABLE `task` DROP `description`;

ALTER TABLE `task` ADD `hours_spent` TIME NULL DEFAULT NULL AFTER `hours`;
ALTER TABLE `task` ADD `closed_by` INT(10) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `task` ADD `comments` INT(10) UNSIGNED NULL DEFAULT NULL AFTER `assigned_to`;

ALTER TABLE `note` CHANGE `content` `content` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

ALTER TABLE `user` ADD `weekoffs` VARCHAR(255) NULL DEFAULT NULL AFTER `role_id`;
ALTER TABLE `user` ADD `leaves` INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `role_id`;
ALTER TABLE `user` ADD `leaves_assigned_on` DATETIME AFTER `leaves`;

CREATE TABLE IF NOT EXISTS `notification` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT(10) UNSIGNED NOT NULL,
    `type` VARCHAR(10) NOT NULL,
    `type_id` INT(10) UNSIGNED NOT NULL,
    `message` VARCHAR(255) NOT NULL,
    `read` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
    `created_by` INT(10) UNSIGNED NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `leaves` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `user_id` int(10) unsigned NOT NULL,
    `date` date NOT NULL,
    `reason` text NULL,
    `approved` tinyint(1) NULL,
    `approved_by` int(10) unsigned NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `report_daily` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT(10) UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `started` TIME NULL,
    `ended` TIME NULL,
    `total_hours` TIME NULL,
    `logged_hours` TIME NULL,
    `productivity` INT(10) NULL DEFAULT 0,
    `no_tasks_worked` INT(10) NULL DEFAULT 0,
    `time_on_tasks` TIME NULL,
    `avg_time_on_tasks` TIME NULL,
    `no_real_tasks_worked` INT(10) NULL DEFAULT 0,
    `time_on_real_tasks` TIME NULL,
    `avg_time_on_real_tasks` TIME NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
