DROP DATABASE IF EXISTS `exo_contacts`;
CREATE DATABASE `exo_contacts` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE pays (
  iso_3 VARCHAR(3) NOT NULL AUTO_INCREMENT,
  iso_2 VARCHAR(2) NOT NULL,
  nom VARCHAR(70) NOT NULL,
  PRIMARY KEY (iso_3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE contacts (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(70) NOT NULL,
  prenom VARCHAR(70) NOT NULL,
  email VARCHAR(70) NOT NULL,
  pays_iso_3 VARCHAR(3) NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_contacts_pays_idx (pays_iso_3 ASC),
  CONSTRAINT fk_contacts_pays
    FOREIGN KEY (pays_iso_3)
    REFERENCES pays (iso_3)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE telephones (
  id INT NOT NULL AUTO_INCREMENT,
  numero VARCHAR(20) NOT NULL,
  contact_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_telephones_contacts1_idx (contact_id ASC),
  CONSTRAINT fk_telephones_contacts1
    FOREIGN KEY (contact_id)
    REFERENCES contacts (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB DEFAULT CHARSET=utf8;