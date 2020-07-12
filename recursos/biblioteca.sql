-- MySQL Script generated by MySQL Workbench
-- Sat Jul 11 19:58:33 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET latin1 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario_rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_rol_usuario_idx` (`usuario_id` ASC) ,
  INDEX `fk_usuario_rol_rol1_idx` (`rol_id` ASC) ,
  CONSTRAINT `fk_usuario_rol_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `biblioteca`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `biblioteca`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `slug` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`permiso_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`permiso_rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_id` INT NOT NULL,
  `permiso_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permiso_rol_rol1_idx` (`rol_id` ASC) ,
  INDEX `fk_permiso_rol_permiso1_idx` (`permiso_id` ASC) ,
  CONSTRAINT `fk_permiso_rol_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `biblioteca`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permiso_rol_permiso1`
    FOREIGN KEY (`permiso_id`)
    REFERENCES `biblioteca`.`permiso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `isbn` VARCHAR(30) NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `cantidad` TINYINT(2) NOT NULL,
  `editorial` VARCHAR(45) NULL,
  `foto` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`libro_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libro_prestamo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `libro_id` INT NOT NULL,
  `fecha_prestamo` DATE NOT NULL,
  `prestado_a` VARCHAR(100) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `fecha_devolucion` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_libro_prestamo_usuario1_idx` (`usuario_id` ASC) ,
  INDEX `fk_libro_prestamo_libro1_idx` (`libro_id` ASC) ,
  CONSTRAINT `fk_libro_prestamo_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `biblioteca`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libro_prestamo_libro1`
    FOREIGN KEY (`libro_id`)
    REFERENCES `biblioteca`.`libro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;