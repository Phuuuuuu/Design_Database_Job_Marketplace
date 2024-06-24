CREATE TABLE `category` (
  `caregory_id` int PRIMARY KEY AUTO_INCREMENT,
  `category_icon` image,
  `category_name` varchar(255),
  `job_id` int
);

CREATE TABLE `job` (
  `job_id` int PRIMARY KEY AUTO_INCREMENT,
  `recruiter_id` int,
  `company_id` int,
  `job_name` varchar(255),
  `salary_min` decimal,
  `salary_max` decimal,
  `address` varchar(255),
  `location_id` int,
  `job_type` varchar(255),
  `job_decription` varchar(255),
  `job_responsibilities` varchar(255)
);

CREATE TABLE `recruiter` (
  `recruiter_id` int PRIMARY KEY AUTO_INCREMENT,
  `recruiter_name` varchar(255),
  `recruiter_level` varchar(255)
);

CREATE TABLE `company` (
  `company_id` int PRIMARY KEY AUTO_INCREMENT,
  `rating_id` int,
  `preview_id` int,
  `company_name` varchar(255),
  `website` varchar(255),
  `company_description` varchar(255),
  `company_type` varchar(255),
  `quantity_member` int,
  `week_working` timestamp,
  `location_id` int,
  `about_us` varchar(255),
  `why_choosing` varchar(255),
  `life_at` image
);

CREATE TABLE `topCompany` (
  `topCompany_id` int PRIMARY KEY AUTO_INCREMENT,
  `company_id` int
);

CREATE TABLE `rating` (
  `rating_id` int PRIMARY KEY AUTO_INCREMENT,
  `star` double,
  `compensation` double,
  `carrer_development` double,
  `culture` double,
  `workspace` double
);

CREATE TABLE `preview` (
  `preview_id` int PRIMARY KEY AUTO_INCREMENT,
  `candiates` int,
  `comment` varchar(255)
);

CREATE TABLE `candiates` (
  `candiates_id` int PRIMARY KEY AUTO_INCREMENT,
  `avatar` image,
  `candiates_name` varchar(255),
  `profile_link` varchar(255),
  `about` varchar(255),
  `live` varchar(255),
  `jobAt_id` int,
  `skill_id` int,
  `education_id` int,
  `experience_id` int
);

CREATE TABLE `skill` (
  `skill_id` int PRIMARY KEY AUTO_INCREMENT,
  `skill_name` varchar(255)
);

CREATE TABLE `location` (
  `location_id` int PRIMARY KEY AUTO_INCREMENT,
  `location_name` varchar(255)
);

CREATE TABLE `jobAt` (
  `jobAt_id` int PRIMARY KEY AUTO_INCREMENT,
  `job_id` int,
  `company_id` int
);

CREATE TABLE `experience` (
  `experience_id` int PRIMARY KEY AUTO_INCREMENT,
  `JobAt_id` int,
  `time_start` timestamp,
  `time_end` timestamp
);

CREATE TABLE `school` (
  `school_id` int PRIMARY KEY AUTO_INCREMENT,
  `school_name` varchar(255)
);

CREATE TABLE `education` (
  `education_id` int PRIMARY KEY AUTO_INCREMENT,
  `school_id` int,
  `study_start` timestamp,
  `study_end` timestamp
);

CREATE TABLE `message` (
  `message_id` int PRIMARY KEY AUTO_INCREMENT,
  `candiates_id` int,
  `context` varchar(255)
);

ALTER TABLE `job` ADD FOREIGN KEY (`job_id`) REFERENCES `category` (`job_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`recruiter_id`) REFERENCES `recruiter` (`recruiter_id`);

ALTER TABLE `job` ADD FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

CREATE TABLE `location_job` (
  `location_location_id` int,
  `job_location_id` int,
  PRIMARY KEY (`location_location_id`, `job_location_id`)
);

ALTER TABLE `location_job` ADD FOREIGN KEY (`location_location_id`) REFERENCES `location` (`location_id`);

ALTER TABLE `location_job` ADD FOREIGN KEY (`job_location_id`) REFERENCES `job` (`location_id`);


ALTER TABLE `rating` ADD FOREIGN KEY (`rating_id`) REFERENCES `company` (`rating_id`);

ALTER TABLE `preview` ADD FOREIGN KEY (`preview_id`) REFERENCES `company` (`preview_id`);

ALTER TABLE `company` ADD FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

ALTER TABLE `company` ADD FOREIGN KEY (`company_id`) REFERENCES `topCompany` (`company_id`);

ALTER TABLE `preview` ADD FOREIGN KEY (`candiates`) REFERENCES `candiates` (`candiates_id`);

ALTER TABLE `candiates` ADD FOREIGN KEY (`live`) REFERENCES `location` (`location_id`);

ALTER TABLE `candiates` ADD FOREIGN KEY (`jobAt_id`) REFERENCES `jobAt` (`jobAt_id`);

ALTER TABLE `skill` ADD FOREIGN KEY (`skill_id`) REFERENCES `candiates` (`skill_id`);

CREATE TABLE `education_candiates` (
  `education_education_id` int,
  `candiates_education_id` int,
  PRIMARY KEY (`education_education_id`, `candiates_education_id`)
);

ALTER TABLE `education_candiates` ADD FOREIGN KEY (`education_education_id`) REFERENCES `education` (`education_id`);

ALTER TABLE `education_candiates` ADD FOREIGN KEY (`candiates_education_id`) REFERENCES `candiates` (`education_id`);


CREATE TABLE `experience_candiates` (
  `experience_experience_id` int,
  `candiates_experience_id` int,
  PRIMARY KEY (`experience_experience_id`, `candiates_experience_id`)
);

ALTER TABLE `experience_candiates` ADD FOREIGN KEY (`experience_experience_id`) REFERENCES `experience` (`experience_id`);

ALTER TABLE `experience_candiates` ADD FOREIGN KEY (`candiates_experience_id`) REFERENCES `candiates` (`experience_id`);


ALTER TABLE `jobAt` ADD FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`);

ALTER TABLE `jobAt` ADD FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

ALTER TABLE `experience` ADD FOREIGN KEY (`JobAt_id`) REFERENCES `jobAt` (`jobAt_id`);

CREATE TABLE `school_education` (
  `school_school_id` int,
  `education_school_id` int,
  PRIMARY KEY (`school_school_id`, `education_school_id`)
);

ALTER TABLE `school_education` ADD FOREIGN KEY (`school_school_id`) REFERENCES `school` (`school_id`);

ALTER TABLE `school_education` ADD FOREIGN KEY (`education_school_id`) REFERENCES `education` (`school_id`);


CREATE TABLE `candiates_message` (
  `candiates_candiates_id` int,
  `message_candiates_id` int,
  PRIMARY KEY (`candiates_candiates_id`, `message_candiates_id`)
);

ALTER TABLE `candiates_message` ADD FOREIGN KEY (`candiates_candiates_id`) REFERENCES `candiates` (`candiates_id`);

ALTER TABLE `candiates_message` ADD FOREIGN KEY (`message_candiates_id`) REFERENCES `message` (`candiates_id`);


ALTER TABLE `jobAt` ADD FOREIGN KEY (`company_id`) REFERENCES `jobAt` (`job_id`);
