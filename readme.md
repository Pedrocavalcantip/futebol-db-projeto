## Projeto de Banco de Dados - Campaoneto de Futebol
### Equipe:
- Davi Peixoto Freire Falcão (dpff@cin.ufpe.br)
- Felipe Costa Coutinho (fcc4@cin.ufpe.br)
- Flávio Henrique Miranda Júnior (fhmj@cin.ufpe.br )
- Hugo Kauan Leal Castro (hklc@cin.ufpe.br)
- Ithalo Rannieri Araujo Soares (iras@cin.ufpe.br)
- Pedro Francisco da Costa Cavalcanti (pfcc@cin.ufpe.br)

### Minimundo
O sistema de gerenciamento de campeonatos de futebol tem como objetivo controlar todas as informações relacionadas às competições, clubes, pessoas envolvidas, partidas e contratos. Cada campeonato é identificado por um nome, temporada e regulamento, sendo organizado em diversas rodadas que dependem dos campeonatos e que são contabilizadas pelo número da rodada, pelo campeonato que elas participam e pelo seu próprio id. Os clubes participantes são cadastrados com seus dados principais e podem disputar diferentes campeonatos ao longo do tempo. Cada clube possui um técnico responsável e mantém jogadores vinculados para serem considerados clubes e os mesmos precisam estar vinculados a um clube para serem considerados jogadores ou técnicos.

As pessoas são registradas no sistema tendo o CPF como base, o nome, a nacionalidade e a data de nascimento e devem assumir os
papéis de juiz, jogador ou técnico, podendo assumir apenas um desses. Os juízes, devidamente credenciados, são responsáveis por arbitrar partidas. Os jogadores são classificados, ou não, em posições específicas, com um jogador podendo jogar em mais de uma posição, sendo ela:: atacantes (gols marcados), meio-campistas (assistências) e defensores (desarmes). Os técnicos possuem licença de treinador e comandam as equipes.

As partidas, núcleo central do sistema, estão sempre ligadas a um campeonato, a uma rodada, a dois clubes distintos, a um estádio previamente cadastrado e a um juiz. Cada partida registra data, horário e placares. Durante os jogos, podem ocorrer gols e cartões disciplinares. Os gols registram o autor e o clube beneficiado, enquanto os cartões, que podem ser amarelos ou vermelhos, são aplicados a jogadores ou técnicos. Além disso, o sistema permite gerenciar contratos de jogadores com clubes, registrando salário-base e período de vínculo, bem como contratos de patrocínio, que podem envolver tanto clubes quanto jogadores. Os patrocinadores são responsáveis por apoiar financeiramente as equipes e atletas durante a vigência do contrato, tendo que ter o nome do patrocinador e o id, assim salvando o valor e as datas de início e fim no contrato de patrocínio, junto com as chaves primárias dos participantes. Os estádios, por sua vez, são cadastrados com nome, cidade e capacidade, e constituem os locais de realização das partidas.

## Stack
O banco de dados será desenvolvido em PostgreSQL com conexão implementada em Python.