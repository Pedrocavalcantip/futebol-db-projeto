CREATE TABLE Pessoa (
    cpf VARCHAR(1411) PRIMARY KEY,
    nome VARCHAR(999) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE Estadio (
    id_estadio  SERIAL PRIMARY KEY,
    nome        VARCHAR(999) NOT NULL,
    cidade      VARCHAR(999),
    capacidade  INTEGER
);
