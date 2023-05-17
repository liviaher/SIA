-- MySQL Script generated by MySQL Workbench
-- Wed May 17 12:14:48 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(245) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `RG_aluno` VARCHAR(45) NOT NULL,
  `sair_sozinho` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idAluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Responsavel` (
  `idResponsavel` INT NOT NULL,
  `nome_responsavel` VARCHAR(200) NOT NULL,
  `CPF_responsavel` VARCHAR(45) NOT NULL,
  `email_responsavel` VARCHAR(45) NOT NULL,
  `telefone_responsavel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResponsavel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno_has_Responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno_has_Responsavel` (
  `Aluno_idAluno` INT NOT NULL,
  `Responsavel_idResponsavel` INT NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`, `Responsavel_idResponsavel`),
  INDEX `fk_Aluno_has_Responsavel_Responsavel1_idx` (`Responsavel_idResponsavel` ASC) VISIBLE,
  INDEX `fk_Aluno_has_Responsavel_Aluno_idx` (`Aluno_idAluno` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_has_Responsavel_Aluno`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Responsavel_Responsavel1`
    FOREIGN KEY (`Responsavel_idResponsavel`)
    REFERENCES `mydb`.`Responsavel` (`idResponsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `nome_curso` VARCHAR(45) NOT NULL,
  `desc_curso` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coordenador` (
  `idCoordenador` INT NOT NULL,
  `CPF_coordenador` VARCHAR(45) NOT NULL,
  `nome_coordenador` VARCHAR(200) NOT NULL,
  `telefone_coordenador` VARCHAR(45) NULL,
  `email_coordenador` VARCHAR(45) NULL,
  PRIMARY KEY (`idCoordenador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Unidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Unidade` (
  `idUnidade` INT NOT NULL,
  `Coordenador_idCoordenador` INT NOT NULL,
  `nome_unidade` VARCHAR(200) NOT NULL,
  `end_unidade` VARCHAR(200) NOT NULL,
  `telefone_unidade` VARCHAR(45) NOT NULL,
  `email_unidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUnidade`),
  INDEX `fk_Unidade_Coordenador1_idx` (`Coordenador_idCoordenador` ASC) VISIBLE,
  CONSTRAINT `fk_Unidade_Coordenador1`
    FOREIGN KEY (`Coordenador_idCoordenador`)
    REFERENCES `mydb`.`Coordenador` (`idCoordenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Unidade_has_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Unidade_has_Curso` (
  `Unidade_idUnidade` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`Unidade_idUnidade`, `Curso_idCurso`),
  INDEX `fk_Unidade_has_Curso_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  INDEX `fk_Unidade_has_Curso_Unidade1_idx` (`Unidade_idUnidade` ASC) VISIBLE,
  CONSTRAINT `fk_Unidade_has_Curso_Unidade1`
    FOREIGN KEY (`Unidade_idUnidade`)
    REFERENCES `mydb`.`Unidade` (`idUnidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unidade_has_Curso_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Divulgador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Divulgador` (
  `idDivulgador` INT NOT NULL,
  `CPF_divulgador` VARCHAR(45) NOT NULL,
  `nome_divulgador` VARCHAR(200) NOT NULL,
  `telefone_divulgador` VARCHAR(45) NOT NULL,
  `email_divulgador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDivulgador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedagogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedagogo` (
  `idPedagogo` INT NOT NULL,
  `nome_pedagogo` VARCHAR(45) NULL,
  `cpf_pedagogo` VARCHAR(45) NULL,
  `telefone_pedagogo` VARCHAR(45) NULL,
  `email_pedagogo` VARCHAR(45) NULL,
  PRIMARY KEY (`idPedagogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modulo` (
  `idModulo` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  `Pedagogo_idPedagogo` INT NOT NULL,
  `nome_modulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModulo`),
  INDEX `fk_Modulo_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  INDEX `fk_Modulo_Pedagogo1_idx` (`Pedagogo_idPedagogo` ASC) VISIBLE,
  CONSTRAINT `fk_Modulo_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modulo_Pedagogo1`
    FOREIGN KEY (`Pedagogo_idPedagogo`)
    REFERENCES `mydb`.`Pedagogo` (`idPedagogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `idTurma` INT NOT NULL,
  `data_inicio` DATE NULL,
  `Modulo_idModulo` INT NOT NULL,
  `Unidade_has_Curso_Unidade_idUnidade` INT NOT NULL,
  `Unidade_has_Curso_Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `fk_Turma_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  INDEX `fk_Turma_Unidade_has_Curso1_idx` (`Unidade_has_Curso_Unidade_idUnidade` ASC, `Unidade_has_Curso_Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Turma_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `mydb`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Turma_Unidade_has_Curso1`
    FOREIGN KEY (`Unidade_has_Curso_Unidade_idUnidade` , `Unidade_has_Curso_Curso_idCurso`)
    REFERENCES `mydb`.`Unidade_has_Curso` (`Unidade_idUnidade` , `Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `Unidade_has_Curso_Unidade_idUnidade` INT NOT NULL,
  `Unidade_has_Curso_Curso_idCurso` INT NOT NULL,
  `Divulgador_idDivulgador` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `Turma_idTurma` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Unidade_has_Curso1_idx` (`Unidade_has_Curso_Unidade_idUnidade` ASC, `Unidade_has_Curso_Curso_idCurso` ASC) VISIBLE,
  INDEX `fk_Matricula_Divulgador1_idx` (`Divulgador_idDivulgador` ASC) VISIBLE,
  INDEX `fk_Matricula_Turma1_idx` (`Turma_idTurma` ASC) VISIBLE,
  INDEX `fk_Matricula_Aluno1_idx` (`Aluno_idAluno` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Unidade_has_Curso1`
    FOREIGN KEY (`Unidade_has_Curso_Unidade_idUnidade` , `Unidade_has_Curso_Curso_idCurso`)
    REFERENCES `mydb`.`Unidade_has_Curso` (`Unidade_idUnidade` , `Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Divulgador1`
    FOREIGN KEY (`Divulgador_idDivulgador`)
    REFERENCES `mydb`.`Divulgador` (`idDivulgador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Turma1`
    FOREIGN KEY (`Turma_idTurma`)
    REFERENCES `mydb`.`Turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instrutor` (
  `idInstrutor` INT NOT NULL,
  `cpf_instrutor` VARCHAR(45) NULL,
  `nome_instrutor` VARCHAR(200) NULL,
  `telefone_instrutor` VARCHAR(45) NULL,
  `email_instrutor` VARCHAR(45) NULL,
  PRIMARY KEY (`idInstrutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aula` (
  `idAula` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `desc_aula` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `fk_Aula_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  CONSTRAINT `fk_Aula_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `mydb`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Frequencia` (
  `idFrequencia` INT NOT NULL,
  `Matricula_idMatricula` INT NOT NULL,
  `Aula_idAula` INT NOT NULL,
  `Instrutor_idInstrutor` INT NOT NULL,
  `data` DATE NOT NULL,
  `status_freq` TINYINT NOT NULL,
  PRIMARY KEY (`idFrequencia`),
  INDEX `fk_Frequencia_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  INDEX `fk_Frequencia_Aula1_idx` (`Aula_idAula` ASC) VISIBLE,
  INDEX `fk_Frequencia_Instrutor1_idx` (`Instrutor_idInstrutor` ASC) VISIBLE,
  CONSTRAINT `fk_Frequencia_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Frequencia_Aula1`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `mydb`.`Aula` (`idAula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Frequencia_Instrutor1`
    FOREIGN KEY (`Instrutor_idInstrutor`)
    REFERENCES `mydb`.`Instrutor` (`idInstrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cobrança`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cobrança` (
  `idCobrança` INT NOT NULL,
  `desc_cobranca` VARCHAR(200) NOT NULL,
  `data_cobranca` DATE NOT NULL,
  `Coordenador_idCoordenador` INT NOT NULL,
  `Matricula_idMatricula` INT NOT NULL,
  PRIMARY KEY (`idCobrança`),
  INDEX `fk_Cobrança_Coordenador1_idx` (`Coordenador_idCoordenador` ASC) VISIBLE,
  INDEX `fk_Cobrança_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Cobrança_Coordenador1`
    FOREIGN KEY (`Coordenador_idCoordenador`)
    REFERENCES `mydb`.`Coordenador` (`idCoordenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cobrança_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
