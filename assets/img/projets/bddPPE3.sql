create table travaux
(
codeTravaux int(6) auto_increment,
libelleTravaux varchar(30),
dureeImmobilisation int(3),
constraint PK_TRAVAUX primary key (codeTravaux)
)engine=innodb;

CREATE TABLE container (
    numContainer INT(6) AUTO_INCREMENT,
    dateAchat DATE,
    typeContainer VARCHAR(40),
    dateDerniereInsp DATE,
    PRIMARY KEY (numContainer)
) ENGINE=InnoDB;

CREATE TABLE probleme (
    codeProb INT(4) AUTO_INCREMENT,   //pas de auto increment car libelle en fonction du code
    libelleProbleme VARCHAR(40),
    PRIMARY KEY (codeProb)
) ENGINE=InnoDB;

create table declaration
(
codeDeclar int(6)auto_increment,
commentaireDeclaration varchar(100),
dateDeclaration date,
urgence int(2) ,check ( urgence between 1 and 10),
traité bool,
numContainer int(6),
codeProb int(4),
codeDocker char(3),
constraint PK_codeDeclaration primary key (codeDeclar),
constraint FK_container foreign key (numContainer) references container(numContainer),
constraint FK_probleme foreign key (codeProb) references probleme(codeProb)
)engine=innodb;

create table inspection
(
numInsp int(3),
numContainer int(6),
dateInsp date,
commentairePostInsp varchar(100),
avis varchar(20),
libelleMotif varchar(40),
libelleEtat varchar(30),
constraint PK_inspection primary key (numInsp,numContainer),
constraint FK_container2 foreign key (numContainer) references container(numcontainer)
)engine=innodb;

create table Decision
(
codeTravaux int(6),
numInsp int(3),
numContainer int(6),
dateEnvoi date,
dateRetour date,
commentaiaireDecision varchar(100),
constraint PK_Decision primary key (codeTravaux,numInsp,numContainer),
constraint FK_inspection foreign key (numInsp,numContainer) references inspection(numInsp,numContainer),
constraint Fk_travaux foreign key (codeTravaux) references travaux(codeTravaux)
)engine=innodb;

#-------------------------------------LesInsert-------------------------------------#
INSERT INTO `container` (`numContainer`, `dateAchat`, `typeContainer`, `dateDerniereInsp`) VALUES
('', '2015-10-20', 'Reefer', '2019-11-08'),
('', '2016-10-10', 'High Cube', '2018-07-08'),
('', '2017-06-25', 'Open Top', '2017-12-10'),
('', '2018-03-30', 'Citerne', '2020-06-10'),
('', '2017-05-03', 'Reefer', '2021-01-18');

INSERT INTO `probleme` (`codeProb`, `libelleProbleme`) VALUES
('', 'Tag'),
('', 'Corrosion'),
('', 'Choc sur container'),
('', 'Gong defectueux'),
('', 'paroi percée'),
('', 'système de fermeture défectueux'),
('', 'pb réfrigération'), 
('', 'Autre');

insert into travaux (codeTravaux,libelleTravaux,dureeImmobilisation)  VALUES
('','nettoyer le tag',20),
('','reparation de systeme',144);

insert into declaration (codeDeclar,commentaireDeclaration,dateDeclaration,urgence,traité,numContainer,codeProb) VALUES
('','balala','2015-10-20','02',false,1,'4'),
('','bololo','2018-03-30','10',false,4,'6');

insert into inspection (numInsp,numContainer,dateInsp,commentairePostInsp,avis,libelleMotif,libelleEtat) VALUES
('',2,2018-07-08,'belele','lololololo','accident','fqes'),
('',5,2021-01-18,'lolalo','lilililili','mort','gufu');