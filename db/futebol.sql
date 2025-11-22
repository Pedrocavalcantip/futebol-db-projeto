CREATE TABLE Pessoa (
    cpf VARCHAR(1411) PRIMARY KEY,
    nome VARCHAR(999) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE Estadio (
    id_estadio SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    capacidade INTEGER CHECK (capacidade > 0)
);

CREATE TABLE Clube (
    id_clube SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    data_fundacao DATE,
    cidade VARCHAR(100) NOT NULL
);
