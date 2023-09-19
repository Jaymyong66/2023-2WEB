CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `password` CHAR(64) NOT NULL,
    `user_name` CHAR(16) NOT NULL,
    `display_name` CHAR(16) NOT NULL,
    `profile_image_link` VARCHAR(128) NOT NULL,
    `profile_state_message` VARCHAR(128) NOT NULL,
    `deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `channel_id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(32) NOT NULL,
    `created_user_name` INT NOT NULL,
    `channel_link` VARCHAR(128) NOT NULL,
    `max_capacity` INT NOT NULL,
    `deleted` TINYINT(1) NOT NULL DEFAULT 0,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`channel_id`),
    FOREIGN KEY (`created_user_name`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
      `chat_id` INT NOT NULL AUTO_INCREMENT,
    `message` TEXT NOT NULL,
    `chat_user` INT NOT NULL,
    `channel` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`chat_id`),
    FOREIGN KEY (`chat_user`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `follow_id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`follow_id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`follower`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `block_id` INT NOT NULL AUTO_INCREMENT,
    `block_by` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `create_date` DATETIME NOT NULL,
    PRIMARY KEY (`block_id`),
    FOREIGN KEY (`block_by`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`password`, `user_name`, `display_name`, `profile_image_link`, `profile_state_message`, `join_date`)
VALUES ('hashed_password_value', 'username_value', 'display_', 'image_link_value', 'state_message_value', NOW());

INSERT INTO `users` (`password`, `user_name`, `display_name`, `profile_image_link`, `profile_state_message`, `join_date`)
VALUES ('hashed_password_value', 'username_value', 'display_', 'image_link_value', 'state_message_value', NOW());

INSERT INTO `users` (`password`, `user_name`, `display_name`, `profile_image_link`, `profile_state_message`, `join_date`)
VALUES ('hashed_password_value', 'username_value', 'display_', 'image_link_value', 'state_message_value', NOW());

INSERT INTO `channels` (`channel_name`, `created_user_name`, `channel_link`, `max_capacity`, `create_date`)
VALUES ('Channel 1', 1, 'channel_link_1', 100, NOW());

INSERT INTO `chats` (`message`, `chat_user`, `channel`, `create_date`)
VALUES ('Hello from User One', 1, 1, NOW());

INSERT INTO `follows` (`follower`, `followee`, `create_date`)
VALUES (1, 2, NOW());


INSERT INTO `blocks` (`block_by`, `blocked_user`, `create_date`)
VALUES (1, 3, NOW());




