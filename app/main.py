import os
import psycopg # Adaptador PostgreSQL para Python

def main():

    # Configurações de conexão
    host = os.getenv("DB_HOST", "localhost")
    port = os.getenv("DB_PORT", "5432")
    db   = os.getenv("DB_NAME", "futebol")
    user = os.getenv("DB_USER", "admin")
    pwd  = os.getenv("DB_PASSWORD", "admin123")

    # Tentativa de conexão e tratamento de erros
    try:
        conn = psycopg.connect(
            host=host,
            port=port,
            dbname=db,
            user=user,
            password=pwd,
        )

        cur = conn.cursor()
        cur.execute("SELECT version();")
        version = cur.fetchone()[0]
        print(f"Conectado ao PostgreSQL: {version}")

        cur.close()
        conn.close()
        print("Conexão fechada.")

    except Exception as e:
        print(f"Falha ao conectar: {e}")

if __name__ == "__main__":
    main()
