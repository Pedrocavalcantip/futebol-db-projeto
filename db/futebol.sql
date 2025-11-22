-- Tabela PESSOA (Superclasse)
CREATE TABLE Pessoa (
    cpf VARCHAR(1411) PRIMARY KEY,
    nome VARCHAR(999) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);