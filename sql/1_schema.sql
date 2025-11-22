CREATE TABLE Pessoa (
    cpf             CHAR(11) PRIMARY KEY,
    nome            VARCHAR(999) NOT NULL,
    nacionalidade   VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE Possiveis_Cartoes (
    id_possiveis_cartoes SERIAL PRIMARY KEY
);
CREATE TABLE Patrocinados (
    id_patrocinado SERIAL PRIMARY KEY
);

CREATE TABLE Clube (
    id_clube        SERIAL PRIMARY KEY,
    id_patrocinado  INTEGER UNIQUE,
    nome            VARCHAR(100) NOT NULL,
    data_fundacao   DATE,
    cidade          VARCHAR(100),
    FOREIGN KEY (id_patrocinado) REFERENCES Patrocinados(id_patrocinado)
);

CREATE TABLE Jogador (
    cpf                 CHAR(11) PRIMARY KEY,
    id_possiveis_cartoes INTEGER,
    id_patrocinado      INTEGER,
    atacante            BOOLEAN DEFAULT FALSE,
    meio_campo          BOOLEAN DEFAULT FALSE,
    defensor            BOOLEAN DEFAULT FALSE,
    gols                INTEGER,
    assistencias        INTEGER,
    desarmes            INTEGER,
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    FOREIGN KEY (id_possiveis_cartoes) REFERENCES Possiveis_Cartoes(id_possiveis_cartoes),
    FOREIGN KEY (id_patrocinado) REFERENCES Patrocinados(id_patrocinado)
);

CREATE TABLE Tecnico (
    cpf                 CHAR(11) PRIMARY KEY,
    id_possiveis_cartoes INTEGER,
    id_clube            INTEGER UNIQUE,
    licenca             VARCHAR(50),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf),
    FOREIGN KEY (id_possiveis_cartoes) REFERENCES Possiveis_Cartoes(id_possiveis_cartoes),
    FOREIGN KEY (id_clube) REFERENCES Clube(id_clube)
);

CREATE TABLE Juiz (
    cpf                CHAR(11) PRIMARY KEY,
    registro_federacao VARCHAR(50),
    FOREIGN KEY (cpf) REFERENCES Pessoa(cpf)
);

CREATE TABLE Patrocinador (
    id_patrocinador   SERIAL PRIMARY KEY,
    nome_patrocinador VARCHAR(100) NOT NULL
);

CREATE TABLE Contrato (
    id_contrato SERIAL PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim    DATE
);

CREATE TABLE Contrato_Jogador (
    id_contrato INTEGER PRIMARY KEY,
    cpf_jogador CHAR(11) NOT NULL,
    id_clube    INTEGER NOT NULL,
    salario     NUMERIC(12,2) NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato),
    FOREIGN KEY (cpf_jogador) REFERENCES Jogador(cpf),
    FOREIGN KEY (id_clube) REFERENCES Clube(id_clube)
);

CREATE TABLE Contrato_Patrocinio (
    id_contrato     INTEGER PRIMARY KEY,
    id_patrocinado  INTEGER NOT NULL,
    id_patrocinador INTEGER NOT NULL,
    valor           NUMERIC(12,2) NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato),
    FOREIGN KEY (id_patrocinado) REFERENCES Patrocinados(id_patrocinado),
    FOREIGN KEY (id_patrocinador) REFERENCES Patrocinador(id_patrocinador)
);

CREATE TABLE Campeonato (
    id_campeonato SERIAL PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    temporada     VARCHAR(20),
    regulamento   TEXT
);

CREATE TABLE Rodada (
    numero_rodada INTEGER,
    id_campeonato INTEGER,
    PRIMARY KEY (numero_rodada, id_campeonato),
    FOREIGN KEY (id_campeonato) REFERENCES Campeonato(id_campeonato)
);

CREATE TABLE Participa (
    id_clube      INTEGER,
    id_campeonato INTEGER,
    PRIMARY KEY (id_clube, id_campeonato),
    FOREIGN KEY (id_clube) REFERENCES Clube(id_clube),
    FOREIGN KEY (id_campeonato) REFERENCES Campeonato(id_campeonato)
);

CREATE TABLE Estadio (
    id_estadio  SERIAL PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    cidade      VARCHAR(100),
    capacidade  INTEGER
);

CREATE TABLE Partida (
    id_partida        SERIAL PRIMARY KEY,
    id_campeonato     INTEGER NOT NULL,
    numero_rodada     INTEGER NOT NULL,
    id_clube_mandante INTEGER NOT NULL,
    id_clube_visitante INTEGER NOT NULL,
    cpf_juiz          CHAR(11) NOT NULL,
    id_estadio        INTEGER NOT NULL,
    data_partida      DATE NOT NULL,
    horario           TIME,
    placar_mandante   INTEGER DEFAULT 0,
    placar_visitante  INTEGER DEFAULT 0,
    FOREIGN KEY (id_campeonato, numero_rodada)
        REFERENCES Rodada(id_campeonato, numero_rodada),
    FOREIGN KEY (id_clube_mandante) REFERENCES Clube(id_clube),
    FOREIGN KEY (id_clube_visitante) REFERENCES Clube(id_clube),
    FOREIGN KEY (cpf_juiz) REFERENCES Juiz(cpf),
    FOREIGN KEY (id_estadio) REFERENCES Estadio(id_estadio),
    CHECK (id_clube_mandante <> id_clube_visitante)
);

CREATE TABLE Gol (
    id_partida  INTEGER,
    cpf_jogador CHAR(11),
    minuto      INTEGER,
    PRIMARY KEY (id_partida, cpf_jogador, minuto),
    FOREIGN KEY (id_partida) REFERENCES Partida(id_partida),
    FOREIGN KEY (cpf_jogador) REFERENCES Jogador(cpf)
);

CREATE TABLE Cartao (
    id_partida         INTEGER,
    id_possiveis_cartoes INTEGER,
    tipo_cartao        VARCHAR(10) NOT NULL,
    minuto             INTEGER,
    PRIMARY KEY (id_partida, id_possiveis_cartoes, minuto),
    FOREIGN KEY (id_partida) REFERENCES Partida(id_partida),
    FOREIGN KEY (id_possiveis_cartoes) REFERENCES Possiveis_Cartoes(id_possiveis_cartoes),
    CHECK (tipo_cartao IN ('amarelo', 'vermelho'))
);
