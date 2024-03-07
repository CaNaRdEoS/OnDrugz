CREATE TABLE Compte(
   id_Compte INT,
   email VARCHAR(50),
   mdp INT,
   pseudo VARCHAR(50),
   xp INT,
   ville VARCHAR(50),
   photo VARCHAR(50),
   argent DECIMAL(15,2),
   date_inscription DATE,
   a_propos VARCHAR(200),
   certifie LOGICAL,
   PRIMARY KEY(id_Compte)
);

CREATE TABLE Produit(
   id_Produit INT,
   nom VARCHAR(50),
   etat VARCHAR(50),
   drogue LOGICAL,
   PRIMARY KEY(id_Produit)
);

CREATE TABLE Symptomes(
   id_Symptomes INT,
   nom VARCHAR(50),
   zone VARCHAR(50),
   danger BYTE,
   PRIMARY KEY(id_Symptomes)
);

CREATE TABLE Drogue(
   id_Drogue INT,
   nom VARCHAR(50),
   note DECIMAL(1,1),
   certifie LOGICAL,
   photo VARCHAR(50),
   etat VARCHAR(50),
   PRIMARY KEY(id_Drogue)
);

CREATE TABLE Subir(
   id_Symptomes INT,
   id_Produit INT,
   densité DECIMAL(15,2),
   PRIMARY KEY(id_Symptomes, id_Produit, densité),
   FOREIGN KEY(id_Symptomes) REFERENCES Symptomes(id_Symptomes),
   FOREIGN KEY(id_Produit) REFERENCES Produit(id_Produit)
);

CREATE TABLE Cuisine(
   id_Usine INT,
   nom VARCHAR(50),
   niveau INT,
   prix CURRENCY,
   stock DECIMAL(15,2),
   id_Produit INT NOT NULL,
   PRIMARY KEY(id_Usine),
   FOREIGN KEY(id_Produit) REFERENCES Produit(id_Produit)
);

CREATE TABLE Historique(
   id_Historique INT,
   transaction DATE,
   id_Drogue INT NOT NULL,
   id_Compte INT NOT NULL,
   id_Compte_1 INT NOT NULL,
   PRIMARY KEY(id_Historique),
   FOREIGN KEY(id_Drogue) REFERENCES Drogue(id_Drogue),
   FOREIGN KEY(id_Compte) REFERENCES Compte(id_Compte),
   FOREIGN KEY(id_Compte_1) REFERENCES Compte(id_Compte)
);

CREATE TABLE Missions(
   id_Missions INT,
   paie CURRENCY,
   corps VARCHAR(50),
   date_limite DATE,
   fini LOGICAL,
   id_Compte INT NOT NULL,
   PRIMARY KEY(id_Missions),
   FOREIGN KEY(id_Compte) REFERENCES Compte(id_Compte)
);

CREATE TABLE Constituer(
   id_Produit INT,
   id_Drogue INT,
   quantite DECIMAL(15,2),
   PRIMARY KEY(id_Produit, id_Drogue),
   FOREIGN KEY(id_Produit) REFERENCES Produit(id_Produit),
   FOREIGN KEY(id_Drogue) REFERENCES Drogue(id_Drogue)
);

CREATE TABLE Possede(
   id_Compte INT,
   id_Drogue INT,
   quantite DECIMAL(15,2),
   prix CURRENCY,
   PRIMARY KEY(id_Compte, id_Drogue),
   FOREIGN KEY(id_Compte) REFERENCES Compte(id_Compte),
   FOREIGN KEY(id_Drogue) REFERENCES Drogue(id_Drogue)
);

CREATE TABLE Commenter(
   id_Compte INT,
   message VARCHAR(50),
   note DECIMAL(1,1),
   mise_en_ligne DATE,
   id_Drogue INT NOT NULL,
   PRIMARY KEY(id_Compte),
   FOREIGN KEY(id_Compte) REFERENCES Compte(id_Compte),
   FOREIGN KEY(id_Drogue) REFERENCES Drogue(id_Drogue)
);

CREATE TABLE Gerer(
   id_Compte INT,
   id_Usine INT,
   PRIMARY KEY(id_Compte, id_Usine),
   FOREIGN KEY(id_Compte) REFERENCES Compte(id_Compte),
   FOREIGN KEY(id_Usine) REFERENCES Cuisine(id_Usine)
);

CREATE TABLE Demander(
   id_Drogue INT,
   id_Missions INT,
   PRIMARY KEY(id_Drogue, id_Missions),
   FOREIGN KEY(id_Drogue) REFERENCES Drogue(id_Drogue),
   FOREIGN KEY(id_Missions) REFERENCES Missions(id_Missions)
);
