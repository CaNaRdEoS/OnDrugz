CREATE TABLE Compte(
   id_Compte COUNTER,
   email VARCHAR(50),
   mdp INT,
   pseudo VARCHAR(50),
   xp INT,
   ville VARCHAR(50),
   photo VARCHAR(50),
   PRIMARY KEY(id_Compte)
);

CREATE TABLE Produit(
   id_Produit COUNTER,
   nom VARCHAR(50),
   etat VARCHAR(50),
   drogue LOGICAL,
   prix VARCHAR(50),
   PRIMARY KEY(id_Produit)
);

CREATE TABLE Symptomes(
   id_Symptomes COUNTER,
   nom VARCHAR(50),
   zone VARCHAR(50),
   PRIMARY KEY(id_Symptomes)
);

CREATE TABLE Drogue(
   id_Drogue COUNTER,
   nom VARCHAR(50),
   note DECIMAL(1,1),
   certifie LOGICAL,
   PRIMARY KEY(id_Drogue)
);

CREATE TABLE Subir(
   id_Produit INT,
   id_Symptomes INT,
   densité VARCHAR(50),
   PRIMARY KEY(id_Produit, id_Symptomes),
   FOREIGN KEY(id_Produit) REFERENCES Produit(id_Produit),
   FOREIGN KEY(id_Symptomes) REFERENCES Symptomes(id_Symptomes)
);

CREATE TABLE Constituer(
   id_Produit INT,
   id_Drogue INT,
   quantite INT,
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
