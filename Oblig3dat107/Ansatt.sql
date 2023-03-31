SET search_path TO oblig3;


CREATE TABLE Ansatt (
	ansattid SERIAL PRIMARY KEY,
	brukernavn char(3) UNIQUE,
	Fornavn varchar(15),
	Etternavn varchar(25),
	ansettelsesdato DATE,
	stilling varchar(20),
	månedslønn decimal(8,2),
	avd_id INTEGER NOT NULL,
	prosjekt INTEGER,
	arbeidstimer INTEGER
	
);

CREATE TABLE Avdeling(
	avd_id SERIAL PRIMARY KEY,
	navn varchar(30),
	sjef_id INTEGER NOT NULL
	
);

CREATE TABLE Prosjekt(
	prosjektid SERIAL PRIMARY KEY,
	navn varchar(30),
	beskrivelse varchar(100)
	
);

CREATE TABLE ProsjektAnsatt(
	ansattid SERIAL,
	prosjektid SERIAL,
	arbeidstimer INTEGER,
	CONSTRAINT ansattid FOREIGN KEY (ansattid) REFERENCES Ansatt(ansattid),
	CONSTRAINT prosjektid FOREIGN KEY (prosjektid) REFERENCES Prosjekt(prosjektid),
	PRIMARY KEY (ansattid, prosjektid)

);

ALTER TABLE Ansatt ADD CONSTRAINT Anvdeling_fk FOREIGN KEY (avd_id) REFERENCES Avdeling(avd_id);
ALTER TABLE Ansatt ADD	CONSTRAINT prosjekt_fk FOREIGN KEY (prosjekt) REFERENCES Prosjekt(prosjektid);
ALTER TABLE Avdeling ADD CONSTRAINT sjef_fk FOREIGN KEY (sjef_id) REFERENCES Ansatt(ansattid);

