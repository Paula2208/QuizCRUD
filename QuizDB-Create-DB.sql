-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema QuizDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema QuizDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `QuizDB` DEFAULT CHARACTER SET utf8 ;
USE `QuizDB` ;

-- -----------------------------------------------------
-- Table `QuizDB`.`municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`municipio` (
  `idMunicipio` INT NOT NULL,
  `nombreMunicipio` VARCHAR(45) NULL,
  PRIMARY KEY (`idMunicipio`),
  UNIQUE INDEX `idmunicipio_UNIQUE` (`idMunicipio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`tipoDocumento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`tipoDocumento` (
  `idTipoDocumento` INT NOT NULL,
  `nombreTipoDocumento` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoDocumento`),
  UNIQUE INDEX `idTipoDocumento_UNIQUE` (`idTipoDocumento` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`grupoSanguineo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`grupoSanguineo` (
  `idGrupoSanguineo` INT NOT NULL,
  `nombreGrupoSanguineo` VARCHAR(45) NULL,
  PRIMARY KEY (`idGrupoSanguineo`),
  UNIQUE INDEX `idGrupoSanguineo_UNIQUE` (`idGrupoSanguineo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`profesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`profesion` (
  `idProfesion` INT NOT NULL,
  `nombreProfesion` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfesion`),
  UNIQUE INDEX `idProfesion_UNIQUE` (`idProfesion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`persona` (
  `noDocumento` DOUBLE NOT NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `fechaNacimento` DATE NULL,
  `lugarExp` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `idMunicipioOrigen` INT NULL,
  `idMunicipioResidencia` INT NULL,
  `idTipoDocumento` INT NULL,
  `idGrupoSanguineo` INT NULL,
  `idProfesion` INT NULL,
  `telDirecto` INT NULL,
  `telResidencia` INT NULL,
  PRIMARY KEY (`noDocumento`),
  UNIQUE INDEX `noDocumento_UNIQUE` (`noDocumento` ASC) VISIBLE,
  INDEX `idMunicipio_idx` (`idMunicipioOrigen` ASC) VISIBLE,
  INDEX `idTipoDocumento_idx` (`idTipoDocumento` ASC) VISIBLE,
  INDEX `idGrupoSanguineo_idx` (`idGrupoSanguineo` ASC) VISIBLE,
  INDEX `idProfesion_idx` (`idProfesion` ASC) VISIBLE,
  INDEX `idMunicipioResidencia_idx` (`idMunicipioResidencia` ASC) VISIBLE,
  CONSTRAINT `idMunicipioOrigen`
    FOREIGN KEY (`idMunicipioOrigen`)
    REFERENCES `QuizDB`.`municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTipoDocumento`
    FOREIGN KEY (`idTipoDocumento`)
    REFERENCES `QuizDB`.`tipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGrupoSanguineo`
    FOREIGN KEY (`idGrupoSanguineo`)
    REFERENCES `QuizDB`.`grupoSanguineo` (`idGrupoSanguineo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfesion`
    FOREIGN KEY (`idProfesion`)
    REFERENCES `QuizDB`.`profesion` (`idProfesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idMunicipioResidencia`
    FOREIGN KEY (`idMunicipioResidencia`)
    REFERENCES `QuizDB`.`municipio` (`idMunicipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`tipoPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`tipoPersona` (
  `idTipoPersona` INT NOT NULL,
  `nombreTipoPersona` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoPersona`),
  UNIQUE INDEX `idTipoPersona_UNIQUE` (`idTipoPersona` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`tipoUsuarioSistema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`tipoUsuarioSistema` (
  `idTipoUsuarioSistema` INT NOT NULL,
  `nombreTipoUsuarioSistema` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoUsuarioSistema`),
  UNIQUE INDEX `idTipoUsuarioSistema_UNIQUE` (`idTipoUsuarioSistema` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`estadoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`estadoUsuario` (
  `idEstadoUsuario` INT NOT NULL,
  `nombreEstadoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstadoUsuario`),
  UNIQUE INDEX `idEstadoUsuario_UNIQUE` (`idEstadoUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`cargo` (
  `idCargo` INT NOT NULL,
  `nombreCargo` VARCHAR(45) NULL,
  PRIMARY KEY (`idCargo`),
  UNIQUE INDEX `idCargo_UNIQUE` (`idCargo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`dependencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`dependencia` (
  `idDependencia` INT NOT NULL,
  `nombreDependencia` VARCHAR(45) NULL,
  PRIMARY KEY (`idDependencia`),
  UNIQUE INDEX `idDependencia_UNIQUE` (`idDependencia` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `QuizDB`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `QuizDB`.`empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `NoDocumento` DOUBLE NOT NULL,
  `fotoEmpleado` VARCHAR(45) NULL,
  `fechaIngresoEmpresa` DATE NULL,
  `EPS` VARCHAR(45) NULL,
  `AFP` VARCHAR(45) NULL,
  `idTipoPersona` INT NULL,
  `idTipoUsuarioSistema` INT NULL,
  `idEstadoUsuario` INT NULL,
  `idCargo` INT NULL,
  `idDependencia` INT NULL,
  `codInterno` INT NULL,
  `noTarjeta` DOUBLE NULL,
  `NoTarjetaTM` DOUBLE NULL,
  `telInterno` INT NULL,
  `activo` VARCHAR(5) NULL,
  `fechaRegistro` DATE NULL,
  `fechaVencimiento` DATE NULL,
  `microondas` TINYINT NULL,
  `promedio` INT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE INDEX `idEmpleado_UNIQUE` (`idEmpleado` ASC) VISIBLE,
  INDEX `noDocumento_idx` (`NoDocumento` ASC) VISIBLE,
  INDEX `idTipoPersona_idx` (`idTipoPersona` ASC) VISIBLE,
  INDEX `idTipoUsuarioSistema_idx` (`idTipoUsuarioSistema` ASC) VISIBLE,
  INDEX `idEstadoUsuario_idx` (`idEstadoUsuario` ASC) VISIBLE,
  INDEX `idCargo_idx` (`idCargo` ASC) VISIBLE,
  INDEX `idDependencia_idx` (`idDependencia` ASC) VISIBLE,
  CONSTRAINT `noDocumento`
    FOREIGN KEY (`NoDocumento`)
    REFERENCES `QuizDB`.`persona` (`noDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTipoPersona`
    FOREIGN KEY (`idTipoPersona`)
    REFERENCES `QuizDB`.`tipoPersona` (`idTipoPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTipoUsuarioSistema`
    FOREIGN KEY (`idTipoUsuarioSistema`)
    REFERENCES `QuizDB`.`tipoUsuarioSistema` (`idTipoUsuarioSistema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstadoUsuario`
    FOREIGN KEY (`idEstadoUsuario`)
    REFERENCES `QuizDB`.`estadoUsuario` (`idEstadoUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCargo`
    FOREIGN KEY (`idCargo`)
    REFERENCES `QuizDB`.`cargo` (`idCargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idDependencia`
    FOREIGN KEY (`idDependencia`)
    REFERENCES `QuizDB`.`dependencia` (`idDependencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
