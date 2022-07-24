-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema saludDH
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema saludDH
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `saludDH` DEFAULT CHARACTER SET utf8 ;
USE `saludDH` ;

-- -----------------------------------------------------
-- Table `saludDH`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saludDH`.`especialidades` (
  `nombreEspecialidad` INT NOT NULL,
  PRIMARY KEY (`nombreEspecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saludDH`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saludDH`.`medicos` (
  `matricula` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `especialidades_nombreEspecialidad` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_medicos_especialidades_idx` (`especialidades_nombreEspecialidad` ASC) VISIBLE,
  CONSTRAINT `fk_medicos_especialidades`
    FOREIGN KEY (`especialidades_nombreEspecialidad`)
    REFERENCES `saludDH`.`especialidades` (`nombreEspecialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saludDH`.`turnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saludDH`.`turnos` (
  `idturnos` INT NOT NULL,
  `fecha_y_hora` DATETIME NULL,
  `turnoscol` VARCHAR(45) NULL,
  `medicos_matricula` INT NOT NULL,
  PRIMARY KEY (`idturnos`, `medicos_matricula`),
  INDEX `fk_turnos_medicos1_idx` (`medicos_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_turnos_medicos1`
    FOREIGN KEY (`medicos_matricula`)
    REFERENCES `saludDH`.`medicos` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saludDH`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `saludDH`.`pacientes` (
  `idpacientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `turnos_idturnos` INT NOT NULL,
  PRIMARY KEY (`idpacientes`, `turnos_idturnos`),
  INDEX `fk_pacientes_turnos1_idx` (`turnos_idturnos` ASC) VISIBLE,
  CONSTRAINT `fk_pacientes_turnos1`
    FOREIGN KEY (`turnos_idturnos`)
    REFERENCES `saludDH`.`turnos` (`idturnos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
