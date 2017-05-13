-- MySQL Script generated by MySQL Workbench
-- Sun Apr 16 16:57:02 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema itworks
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itworks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itworks` DEFAULT CHARACTER SET utf8 ;
USE `itworks` ;

-- -----------------------------------------------------
-- Table `itworks`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itworks`.`user` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itworks`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itworks`.`video` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `duration` INT NULL,
  `youtube_id` VARCHAR(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `deleted_at` DATETIME NULL,
  `captions` TEXT NULL,
  `published_at` DATETIME NULL,
  `status` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itworks`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itworks`.`note` (
  `id` INT NOT NULL,
  `content` TEXT NULL,
  `created_at` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_note_user1_idx` (`user_id` ASC),
  INDEX `fk_note_video1_idx` (`video_id` ASC),
  CONSTRAINT `fk_note_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `itworks`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `itworks`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `itworks`.`user_watched_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itworks`.`user_watched_video` (
  `user_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `created_at` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `video_id`),
  INDEX `fk_user_has_video_video1_idx` (`video_id` ASC),
  INDEX `fk_user_has_video_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_video_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `itworks`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `itworks`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;