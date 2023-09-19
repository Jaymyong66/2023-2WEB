CREATE TABLE `students` (
    `student_id` INT NOT NULL AUTO_INCREMENT,
    `student_name` CHAR(20) NOT NULL,
    `student_number` CHAR(11) NOT NULL,
    `enrollment_year` INT NOT NULL,
    `major` CHAR(20) NOT NULL,
    `phone_number` CHAR(13) NOT NULL,
    `address` CHAR(100) NOT NULL,
    `total_credit` INT NOT NULL DEFAULT 0,
    `average_credit` DOUBLE NOT NULL DEFAULT 0.0,
    `enrolled_student` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;