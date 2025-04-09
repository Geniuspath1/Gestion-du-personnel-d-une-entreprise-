# script créé le : Tue Apr 08 14:14:31 CEST 2025 -   syntaxe MySQL ;

# use  VOTRE_BASE_DE_DONNEE ;

DROP TABLE IF EXISTS POSTE ;
CREATE TABLE POSTE (id-poste int AUTO_INCREMENT NOT NULL,
titre VARCHAR(100),
description TEXT,
salaire-base DECIMAL,
PRIMARY KEY (id-poste) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS EMPLOYE ;
CREATE TABLE EMPLOYE (id-employe int AUTO_INCREMENT NOT NULL,
nom CHAR(100),
prenom CHAR(100),
sexe CHAR(1),
date-naissance DATE,
email VARCHAR(100),
telephone VARCHAR(20),
adresse TEXT,
date-embauche DATE,
id-departement_ INT NOT NULL,
id-poste INT NOT NULL,
id-contrat INT NOT NULL,
PRIMARY KEY (id-employe) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS DEPARTEMENT ;
CREATE TABLE DEPARTEMENT (id-departement_ int AUTO_INCREMENT NOT NULL,
nom-departement VARCHAR(100),
description-dep TEXT,
PRIMARY KEY (id-departement_) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS CONGE ;
CREATE TABLE CONGE (id-conge int AUTO_INCREMENT NOT NULL,
date-debutconge DATE,
date-finconge DATE,
type-conge VARCHAR(100),
statut_ VARCHAR(100),
id-employe INT NOT NULL,
PRIMARY KEY (id-conge) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS FORMATION_ ;
CREATE TABLE FORMATION_ (id-formation int AUTO_INCREMENT NOT NULL,
titre-formation VARCHAR(100),
organisme VARCHAR(100),
date-debutformation DATE,
date-finformation_ DATE,
PRIMARY KEY (id-formation) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS CONTRAT ;
CREATE TABLE CONTRAT (id-contrat int AUTO_INCREMENT NOT NULL,
type-contrat VARCHAR(100),
date-debutcontrat DATE,
date-fincontrat DATE,
statut VARCHAR,
id-employe INT NOT NULL,
PRIMARY KEY (id-contrat) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS EVALUATION ;
CREATE TABLE EVALUATION (id-evaluation int AUTO_INCREMENT NOT NULL,
date-evaluation DATE,
note DECIMAL,
commentaire TEXT,
PRIMARY KEY (id-evaluation) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS suit ;
CREATE TABLE suit (id-formation int AUTO_INCREMENT NOT NULL,
id-employe INT NOT NULL,
PRIMARY KEY (id-formation,
 id-employe) ) ENGINE=InnoDB;

DROP TABLE IF EXISTS evalue ;
CREATE TABLE evalue (id-evaluation int AUTO_INCREMENT NOT NULL,
id-employe INT NOT NULL,
PRIMARY KEY (id-evaluation,
 id-employe) ) ENGINE=InnoDB;

ALTER TABLE EMPLOYE ADD CONSTRAINT FK_EMPLOYE_id-departement_ FOREIGN KEY (id-departement_) REFERENCES DEPARTEMENT (id-departement_);

ALTER TABLE EMPLOYE ADD CONSTRAINT FK_EMPLOYE_id-poste FOREIGN KEY (id-poste) REFERENCES POSTE (id-poste);
ALTER TABLE EMPLOYE ADD CONSTRAINT FK_EMPLOYE_id-contrat FOREIGN KEY (id-contrat) REFERENCES CONTRAT (id-contrat);
ALTER TABLE CONGE ADD CONSTRAINT FK_CONGE_id-employe FOREIGN KEY (id-employe) REFERENCES EMPLOYE (id-employe);
ALTER TABLE CONTRAT ADD CONSTRAINT FK_CONTRAT_id-employe FOREIGN KEY (id-employe) REFERENCES EMPLOYE (id-employe);
ALTER TABLE suit ADD CONSTRAINT FK_suit_id-formation FOREIGN KEY (id-formation) REFERENCES FORMATION_ (id-formation);
ALTER TABLE suit ADD CONSTRAINT FK_suit_id-employe FOREIGN KEY (id-employe) REFERENCES EMPLOYE (id-employe);
ALTER TABLE evalue ADD CONSTRAINT FK_evalue_id-evaluation FOREIGN KEY (id-evaluation) REFERENCES EVALUATION (id-evaluation);
ALTER TABLE evalue ADD CONSTRAINT FK_evalue_id-employe FOREIGN KEY (id-employe) REFERENCES EMPLOYE (id-employe);
