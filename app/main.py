import os
import psycopg  # Adaptador PostgreSQL para Python


# -------------------------------
# Função de conexão
# -------------------------------
def get_connection():
    host = os.getenv("DB_HOST", "localhost")
    port = os.getenv("DB_PORT", "5432")
    db   = os.getenv("DB_NAME", "futebol")
    user = os.getenv("DB_USER", "admin")
    pwd  = os.getenv("DB_PASSWORD", "admin123")

    conn = psycopg.connect(
        host=host,
        port=port,
        dbname=db,
        user=user,
        password=pwd,
    )
    return conn


# -------------------------------
# 1) Artilheiro do Pernambucano
# -------------------------------
def consulta_artilheiro_pernambucano(conn):
    sql = """
    WITH gols_campeonato AS (
        SELECT pa.id_campeonato,
               c.nome AS nome_campeonato,
               p.nome AS nome_jogador,
               COUNT(*) AS gols
        FROM Gol g
        JOIN Partida pa ON pa.id_partida = g.id_partida
        JOIN Campeonato c ON pa.id_campeonato = c.id_campeonato
        JOIN Pessoa p ON p.cpf = g.cpf_jogador
        WHERE c.nome ILIKE '%Pernambucano%'
        GROUP BY pa.id_campeonato, c.nome, p.nome
    )
    SELECT nome_jogador, gols
    FROM gols_campeonato
    ORDER BY gols DESC
    LIMIT 1;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        row = cur.fetchone()
        print("\n=== Artilheiro do Campeonato Pernambucano ===")
        if row:
            nome, gols = row
            print(f"{nome} - {gols} gols")
        else:
            print("Nenhum gol encontrado para o Pernambucano.")


# --------------------------------------------
# 2) Classificação do Campeonato Pernambucano
# --------------------------------------------
def consulta_classificacao_pernambucano(conn):
    sql = """
    WITH resultados AS (
        SELECT
            pa.id_campeonato,
            c.id_clube,
            c.nome AS clube,
            CASE 
                WHEN pa.id_clube_mandante = c.id_clube THEN pa.placar_mandante
                ELSE pa.placar_visitante
            END AS gols_pro,
            CASE 
                WHEN pa.id_clube_mandante = c.id_clube THEN pa.placar_visitante
                ELSE pa.placar_mandante
            END AS gols_sofridos,
            CASE 
                WHEN pa.placar_mandante = pa.placar_visitante THEN 1
                WHEN (pa.id_clube_mandante = c.id_clube AND pa.placar_mandante > pa.placar_visitante)
                  OR (pa.id_clube_visitante = c.id_clube AND pa.placar_visitante > pa.placar_mandante)
                THEN 3
                ELSE 0
            END AS pontos,
            CASE 
                WHEN (pa.id_clube_mandante = c.id_clube AND pa.placar_mandante > pa.placar_visitante)
                  OR (pa.id_clube_visitante = c.id_clube AND pa.placar_visitante > pa.placar_mandante)
                THEN 1 ELSE 0 END AS vitorias,
            CASE 
                WHEN pa.placar_mandante = pa.placar_visitante THEN 1 ELSE 0 END AS empates,
            CASE 
                WHEN (pa.id_clube_mandante = c.id_clube AND pa.placar_mandante < pa.placar_visitante)
                  OR (pa.id_clube_visitante = c.id_clube AND pa.placar_visitante < pa.placar_mandante)
                THEN 1 ELSE 0 END AS derrotas
        FROM Partida pa
        JOIN Clube c 
            ON c.id_clube IN (pa.id_clube_mandante, pa.id_clube_visitante)
        WHERE pa.id_campeonato = 1
    )
    SELECT
        clube,
        SUM(pontos) AS pontos,
        SUM(vitorias) AS vitorias,
        SUM(empates) AS empates,
        SUM(derrotas) AS derrotas,
        SUM(gols_pro) AS gols_pro,
        SUM(gols_sofridos) AS gols_sofridos,
        SUM(gols_pro) - SUM(gols_sofridos) AS saldo
    FROM resultados
    GROUP BY clube
    ORDER BY 
        pontos DESC,
        vitorias DESC,
        saldo DESC,
        gols_pro DESC;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Classificação - Campeonato Pernambucano ===")
        print("Clube | Pontos | Vitórias | Empates | Derrotas | GP | GC | Saldo")
        for r in rows:
            print(" | ".join(str(x) for x in r))


# ------------------------------
# 3) Juiz com mais cartões
# ------------------------------
def consulta_juiz_com_mais_cartoes(conn):
    sql = """
    WITH total_cartoes AS (
        SELECT pa.cpf_juiz,
               COUNT(c.*) AS cartoes
        FROM Partida pa
        JOIN Cartao c ON c.id_partida = pa.id_partida
        GROUP BY pa.cpf_juiz
    )
    SELECT p.nome, j.cpf, t.cartoes
    FROM total_cartoes t
    JOIN Juiz j ON j.cpf = t.cpf_juiz
    JOIN Pessoa p ON p.cpf = j.cpf
    ORDER BY t.cartoes DESC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Juízes com mais cartões aplicados ===")
        for nome, cpf, cartoes in rows:
            print(f"{nome} ({cpf}) - {cartoes} cartões")


# ----------------------------------------------
# 4) Jogador mais indisciplinado (mais cartões)
# ----------------------------------------------
def consulta_jogador_mais_indisciplinado(conn):
    sql = """
    SELECT p.nome,
           COUNT(*) AS total_cartoes
    FROM Cartao c
    JOIN Possiveis_Cartoes pc ON pc.id_possiveis_cartoes = c.id_possiveis_cartoes
    JOIN Jogador j ON j.id_possiveis_cartoes = pc.id_possiveis_cartoes
    JOIN Pessoa p ON p.cpf = j.cpf
    GROUP BY p.nome
    ORDER BY total_cartoes DESC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Jogadores mais indisciplinados ===")
        for nome, total in rows:
            print(f"{nome} - {total} cartões")


# -----------------------
# 5) Melhor ataque geral
# -----------------------
def consulta_melhor_ataque_geral(conn):
    sql = """
    WITH gols_por_clube AS (
        SELECT cj.id_clube,
               COUNT(*) AS gols
        FROM Gol g
        JOIN Contrato_Jogador cj ON g.cpf_jogador = cj.cpf_jogador
        GROUP BY cj.id_clube
    )
    SELECT c.nome, gpc.gols
    FROM gols_por_clube gpc
    JOIN Clube c ON c.id_clube = gpc.id_clube
    ORDER BY gpc.gols DESC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Melhores ataques Geral (gols marcados) ===")
        for nome, gols in rows:
            print(f"{nome} - {gols} gols")


# -----------------------
# 6) Melhor defesa geral
# -----------------------
def consulta_melhor_defesa_geral(conn):
    sql = """
    WITH gols_sofridos AS (
        SELECT c.id_clube,
               COUNT(*) AS gols_contra
        FROM Gol g
        JOIN Partida pa ON pa.id_partida = g.id_partida
        JOIN Clube c ON (
            (c.id_clube = pa.id_clube_mandante AND g.cpf_jogador IN (
                SELECT cpf_jogador 
                FROM Contrato_Jogador 
                WHERE id_clube = pa.id_clube_visitante
            ))
            OR
            (c.id_clube = pa.id_clube_visitante AND g.cpf_jogador IN (
                SELECT cpf_jogador 
                FROM Contrato_Jogador 
                WHERE id_clube = pa.id_clube_mandante
            ))
        )
        GROUP BY c.id_clube
    )
    SELECT c.nome, COALESCE(gs.gols_contra, 0) AS total_gols_sofridos
    FROM Clube c
    LEFT JOIN gols_sofridos gs ON c.id_clube = gs.id_clube
    ORDER BY total_gols_sofridos ASC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Melhores defesas Geral (menos gols sofridos) ===")
        for nome, gols_contra in rows:
            print(f"{nome} - {gols_contra} gols sofridos")


# ---------------------------------------
# 7) Clubes com maior folha salarial da temporada
# ---------------------------------------
def consulta_maior_folha_salarial_temporada(conn):
    sql = """
    WITH folha AS (
        SELECT 
            cj.id_clube,
            SUM(cj.salario) AS total_folha
        FROM Contrato_Jogador cj
        GROUP BY cj.id_clube
    )
    SELECT c.nome AS clube,
           f.total_folha
    FROM folha f
    JOIN Clube c ON c.id_clube = f.id_clube
    ORDER BY f.total_folha DESC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Clubes com maior folha salarial da temporada ===")
        for clube, total in rows:
            print(f"{clube} - R$ {total}")


# --------------------------------
# 8) Maiores patrocínios
# --------------------------------
def consulta_maiores_patrocinios(conn):
    sql = """
    WITH patrocinio_clube AS (
        SELECT 
            c.id_clube,
            SUM(cp.valor) AS total_patrocinio
        FROM Clube c
        JOIN Contrato_Patrocinio cp 
             ON cp.id_patrocinado = c.id_patrocinado
        GROUP BY c.id_clube
    )
    SELECT c.nome AS clube,
           p.total_patrocinio
    FROM patrocinio_clube p
    JOIN Clube c ON c.id_clube = p.id_clube
    ORDER BY p.total_patrocinio DESC
    LIMIT 3;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Maiores patrocínios (por clube) ===")
        for clube, total in rows:
            print(f"{clube} - R$ {total}")


# ------------------------------
# 9) Contratos ativos sport
# ------------------------------
def consulta_contratos_ativos_sport(conn):
    sql = """
    SELECT 
        cj.cpf_jogador, 
        cj.id_clube, 
        c.data_inicio, 
        c.data_fim, 
        cj.salario
    FROM Contrato_Jogador cj
    JOIN Contrato c ON c.id_contrato = cj.id_contrato
    WHERE CURRENT_DATE BETWEEN c.data_inicio AND c.data_fim
      AND cj.id_clube = 1;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Contratos ativos - Sport Club do Recife ===")
        for cpf, id_clube, data_inicio, data_fim, salario in rows:
            print(f"Jogador {cpf} | Clube {id_clube} | {data_inicio} a {data_fim} | R$ {salario}")


# ----------------------------------------------------------------
# 10) Jogadores e total de gols em Recife-PE / Copa do Nordeste
# ----------------------------------------------------------------
def consulta_gols_cidade_campeonato(conn):
    sql = """
    SELECT 
        p.nome,
        COUNT(g.minuto) AS total_gols
    FROM Pessoa p
    JOIN Gol g ON p.cpf = g.cpf_jogador
    JOIN Partida pa ON g.id_partida = pa.id_partida
    JOIN Estadio e ON pa.id_estadio = e.id_estadio
    JOIN Campeonato c ON pa.id_campeonato = c.id_campeonato
    WHERE e.cidade = 'Recife-PE' AND c.id_campeonato = 2
    GROUP BY p.nome
    ORDER BY total_gols DESC
    LIMIT 5;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Gols por jogador (Recife-PE, Copa do Nordeste) ===")
        for nome, total in rows:
            print(f"{nome} - {total} gols")


# -------------------------------------------------
# 11) Estatísticas financeiras por clube
# -------------------------------------------------
def consulta_estatisticas_financeiras(conn):
    sql = """
    SELECT
        cl.nome AS clube,
        COUNT(cj.cpf_jogador) AS total_jogadores,
        SUM(cj.salario) AS folha_salarial_total,
        ROUND(AVG(cj.salario), 2) AS media_salarial
    FROM Clube cl
    JOIN Contrato_Jogador cj ON cl.id_clube = cj.id_clube
    JOIN Contrato c ON cj.id_contrato = c.id_contrato
    WHERE c.data_fim > CURRENT_DATE
    GROUP BY cl.nome
    ORDER BY folha_salarial_total DESC
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Estatísticas financeiras por clube ===")
        print("Clube | Jogadores | Folha Total | Média Salarial")
        for clube, total_jogs, folha, media in rows:
            print(f"{clube} | {total_jogs} | {folha} | {media}")


# -------------------------------------------------------
# 12) Técnicos de clubes ricos (folha > 530000)
# -------------------------------------------------------
def consulta_tecnicos_clubes_ricos(conn):
    sql = """
    WITH ClubesRicos AS (
        SELECT cj.id_clube
        FROM Contrato_Jogador cj
        JOIN Contrato c ON c.id_contrato = cj.id_contrato
        WHERE CURRENT_DATE BETWEEN c.data_inicio AND c.data_fim -- Filtra apenas ativos
        GROUP BY cj.id_clube
        HAVING SUM(cj.salario) > 530000
    )
    SELECT 
        p.nome AS tecnico, 
        c.nome AS clube
    FROM Tecnico t
    JOIN Pessoa p ON t.cpf = p.cpf
    JOIN Clube c ON t.id_clube = c.id_clube
    WHERE t.id_clube IN (SELECT id_clube FROM ClubesRicos);
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        print("\n=== Técnicos de clubes considerados 'ricos' (Folha Ativa > 530k) ===")
        if not rows:
            print("Nenhum clube atende ao critério de folha salarial ativa.")
        for tecnico, clube in rows:
            print(f"{tecnico} - {clube}")


# -------------------------------------------------------
# 13) Tudo de uma partida
# -------------------------------------------------------
def consulta_tudo_de_uma_partida(conn):
    sql = """
    SELECT
        camp.nome AS campeonato,
        pa.id_partida,
        pa.data_partida,
        e.nome AS estadio,
        
        c_mand.nome AS mandante,
        pa.placar_mandante,
        c_vis.nome AS visitante,
        pa.placar_visitante,

        CASE
            WHEN pa.placar_mandante > pa.placar_visitante THEN 'Vitória Mandante'
            WHEN pa.placar_visitante > pa.placar_mandante THEN 'Vitória Visitante'
            ELSE 'Empate'
        END AS resultado,

        pj.nome AS nome_juiz,

        pes.nome AS jogador_punido,
        car.tipo_cartao,
        car.minuto AS minuto_cartao

    FROM Partida pa
    JOIN Campeonato camp ON pa.id_campeonato = camp.id_campeonato
    JOIN Estadio e ON pa.id_estadio = e.id_estadio

    JOIN Clube c_mand ON pa.id_clube_mandante = c_mand.id_clube
    JOIN Clube c_vis ON pa.id_clube_visitante = c_vis.id_clube

    JOIN Juiz j ON pa.cpf_juiz = j.cpf
    JOIN Pessoa pj ON j.cpf = pj.cpf

    LEFT JOIN Cartao car ON car.id_partida = pa.id_partida
    LEFT JOIN Jogador jg ON car.id_possiveis_cartoes = jg.id_possiveis_cartoes
    LEFT JOIN Pessoa pes ON jg.cpf = pes.cpf

    ORDER BY pa.id_partida, car.minuto;
    """
    with conn.cursor() as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        if not rows:
            print("\n=== Súmula(s) de partidas ===\nNenhum dado encontrado.")
            return
        print("\n=== Súmula(s) de partidas ===")
        current = None
        cards_present = False
        cards_in_current = False
        for r in rows:
            camp, pid, data_partida, estadio, mand, gol_mand, vis, gol_vis, resultado, juiz, jogador_punido, tipo_cartao, minuto_cartao = r
            if pid != current:
                if current is not None and not cards_in_current:
                    print("Nenhum cartão registrado.")
                # Nova partida
                current = pid
                cards_in_current = False
                print("\n----------------------------------------")
                print(f"Campeonato: {camp}")
                print(f"Partida: {pid} - {data_partida} - Estádio: {estadio}")
                print(f"{mand} {gol_mand} x {gol_vis} {vis}  ({resultado})")
                print(f"Árbitro: {juiz}")
                print("Cartões:")
            if jogador_punido:
                cards_present = True
                cards_in_current = True
                print(f"- {jogador_punido} | {tipo_cartao} aos {minuto_cartao}'")
        # Última partida sem cartões
        if not cards_in_current:
            print("Nenhum cartão registrado.")


# -------------------------------
# Menu interativo
# -------------------------------
def mostrar_menu():
    print("\n================= MENU =================")
    print("1  - Artilheiro do Campeonato Pernambucano")
    print("2  - Classificação do Pernambucano")
    print("3  - Juízes com mais cartões")
    print("4  - Jogadores mais indisciplinados")
    print("5  - Melhor ataque Geral")
    print("6  - Melhor defesa Geral")
    print("7  - Clubes com maior folha salarial da temporada")
    print("8  - Maiores patrocínios")
    print("9  - Contratos de jogadores ativos (Sport Club do Recife)")
    print("10 - Gols por jogador (Recife-PE, Copa do Nordeste)")
    print("11 - Estatísticas financeiras por clube")
    print("12 - Técnicos de clubes ricos")
    print("13 - Tudo de uma partida (súmula detalhada)")
    print("0  - Sair")
    print("========================================")


def main():
    try:
        conn = get_connection()
        print("Conexão estabelecida com sucesso.")

        # Modo não-interativo controlado por variável de ambiente APP_NON_INTERACTIVE.
        # Se APP_NON_INTERACTIVE=1, lê APP_AUTO_RUN com lista de opções (ex: "1,5,11").
        non_interactive = os.getenv("APP_NON_INTERACTIVE", "0") == "1"
        auto_run = os.getenv("APP_AUTO_RUN", "").strip()

        # Mapeamento de funções por opção
        actions = {
            "1": consulta_artilheiro_pernambucano,
            "2": consulta_classificacao_pernambucano,
            "3": consulta_juiz_com_mais_cartoes,
            "4": consulta_jogador_mais_indisciplinado,
            "5": consulta_melhor_ataque_geral,
            "6": consulta_melhor_defesa_geral,
            "7": consulta_maior_folha_salarial_temporada,
            "8": consulta_maiores_patrocinios,
            "9": consulta_contratos_ativos_sport,
            "10": consulta_gols_cidade_campeonato,
            "11": consulta_estatisticas_financeiras,
            "12": consulta_tecnicos_clubes_ricos,
            "13": consulta_tudo_de_uma_partida,
        }

        if non_interactive:
            if not auto_run:
                print("Modo não-interativo ativo. Nada a executar (defina APP_AUTO_RUN). Encerrando.")
            else:
                for opt in [o.strip() for o in auto_run.split(',') if o.strip()]:
                    fn = actions.get(opt)
                    if fn:
                        print(f"\n[AutoRun] Executando opção {opt}")
                        fn(conn)
                    else:
                        print(f"[AutoRun] Opção desconhecida: {opt}")
            conn.close()
            print("Conexão fechada (modo não-interativo).")
            return

        # Modo interativo padrão
        while True:
            mostrar_menu()
            opcao = input("Escolha uma opção: ").strip()

            if opcao == "0":
                print("Saindo...")
                break
            fn = actions.get(opcao)
            if fn:
                fn(conn)
            else:
                print("Opção inválida. Tente novamente.")

        conn.close()
        print("Conexão fechada.")

    except Exception as e:
        print(f"Falha ao conectar ou executar consultas: {e}")


if __name__ == "__main__":
    main()
