CREATE TABLE `user`
(
    `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User''s identifier',
    `name`      VARCHAR(20) NOT NULL COMMENT 'User name',
    `password`  VARCHAR(80) NOT NULL COMMENT 'Password hash',
    `role`      VARCHAR(80) NOT NULL COMMENT 'Role',
    `created`   DATETIME(6) NOT NULL COMMENT 'Record create datetime',
    `modified`  DATETIME(6) NOT NULL COMMENT 'Record modify datetime',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uix_name` (`name`) USING BTREE
) Engine=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User';

CREATE TABLE `task`
(
    `id`        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Task''s identifier',
    `user_id`   BIGINT UNSIGNED NOT NULL COMMENT 'User''s identifier who create a task',
    `title`     VARCHAR(128) NOT NULL COMMENT 'Task title',
    `status`    VARCHAR(20) NOT NULL COMMENT 'Task status',
    `created`   DATETIME(6) NOT NULL COMMENT 'Record create datetime',
    `modified`  DATETIME(6) NOT NULL COMMENT 'Record modify datetime',
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_user_id`
        FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
            ON DELETE RESTRICT ON UPDATE RESTRICT
) Engine=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Task';
