--- Entidades Fortes
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

CREATE TABLE Campeonato (
    id_campeonato SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    temporada VARCHAR(20) NOT NULL,
    regulamento TEXT,
    UNIQUE (nome, temporada)
);

--- Subclasses
CREATE TABLE Juiz (
    cpf VARCHAR(11) PRIMARY KEY,
    registro_federacao VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf) ON DELETE CASCADE -- ON DELETE CASCADE significa que se uma Pessoa for deletada, o Juiz correspondente também será deletado
);

CREATE TABLE Jogador (
    cpf VARCHAR(11) PRIMARY KEY,
    is_atacante BOOLEAN DEFAULT FALSE,
    is_meio_campo BOOLEAN DEFAULT FALSE,
    is_defensor BOOLEAN DEFAULT FALSE,
    -- Estatísticas (para evitar dados nulos desnecessários em Pessoa)
    gols INTEGER DEFAULT 0,
    assistencias INTEGER DEFAULT 0,
    desarmes INTEGER DEFAULT 0,
    CHECK (is_atacante = TRUE OR is_meio_campo = TRUE OR is_defensor = TRUE),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf) ON DELETE CASCADE
);

CREATE TABLE Tecnico (
    cpf VARCHAR(14) PRIMARY KEY,
    licenca VARCHAR(50) UNIQUE NOT NULL,
    id_clube INTEGER UNIQUE,
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf) ON DELETE CASCADE,
    FOREIGN KEY (id_clube) REFERENCES Clube(id_clube)
);

--- Uniao
CREATE TABLE Patrocinados (
    id_patrocinado SERIAL PRIMARY KEY,
    id_clube INTEGER UNIQUE,
    cpf_jogador VARCHAR(14) UNIQUE,

    -- Garante que o Patrocinado é ou um Clube OU um Jogador (Disjunção)
    CHECK ((id_clube IS NOT NULL AND cpf_jogador IS NULL) OR (id_clube IS NULL AND cpf_jogador IS NOT NULL)),

    FOREIGN KEY (id_clube) REFERENCES Clube(id_clube) ON DELETE CASCADE,
    FOREIGN KEY (cpf_jogador) REFERENCES Jogador(cpf) ON DELETE CASCADE
);