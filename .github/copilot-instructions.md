# Copilot instructions for `futebol-db-projeto`

These notes give actionable, codebase-specific guidance for AI coding agents working on this repository.

**Big picture**
- **Stack**: PostgreSQL (image `postgres:16`) + Python (app runs on `python:3.13-slim` image). The DB is initialized from `sql/` on container first start. See `docker/docker-compose.yml`.
- **Runtime**: The CLI-style app lives in `app/main.py` and connects to the DB using the `psycopg` (psycopg3) driver. Queries are embedded as SQL strings inside functions and printed to stdout.

**Where things live**
- `app/main.py`: interactive menu and all example queries; use this to understand query patterns and parameters (example: `consulta_tudo_de_uma_partida` uses a `%s` parameter).
- `docker/docker-compose.yml`: how services are wired (ports, env vars, volume mounts). Key services: `db`, `pgadmin`, `app`.
- `sql/1_schema.sql`, `sql/2_populate.sql`, `sql/3_queries.sql`: DB schema, seed data and (empty) queries file. These are executed by the official Postgres image at container init because the `sql/` folder is mounted into `/docker-entrypoint-initdb.d`.

**Important operational details / developer workflows**
- Start local environment (from repository root):

```powershell
cd docker
docker compose up -d
```

- To run the CLI app locally (outside containers):

```powershell
cd app
python main.py
```

- The `app` Docker service installs `requirements.txt` at startup and runs `python main.py` automatically; to run inside containers use `docker compose up` from `docker/`.
- pgAdmin is available at `http://localhost:5050` (user `admin@admin.com` / `admin123`) and can be used to inspect the `futebol` DB.
- The SQL init scripts are not idempotent (they use `CREATE TABLE` without `IF NOT EXISTS`) and the DB volume persists. To reinitialize the DB you must remove the volume:

```powershell
cd docker
docker compose down -v
docker compose up -d
```

**Environment variables & defaults**
- `app/main.py` reads DB connection info from env vars with defaults: `DB_HOST` (default `localhost`), `DB_PORT` (`5432`), `DB_NAME` (`futebol`), `DB_USER` (`admin`), `DB_PASSWORD` (`admin123`). The `app` service sets these to connect to the `db` service.
- `requirements.txt` contains `psycopg[binary]==3.2.13` and `python-dotenv==1.0.0`. Note: `main.py` does not currently load a `.env` file — set env vars externally or add `load_dotenv()` if you want `.env` support.

**Project-specific code and SQL conventions**
- Table names use PascalCase (`Pessoa`, `Clube`, `Partida`, etc.). Primary keys: some use `SERIAL` integers, many people use `cpf CHAR(11)` as PKs. Composite PKs exist (e.g., `Gol`, `Cartao`).
- The schema uses composite foreign keys (example: `Partida` references `Rodada` via `(id_campeonato, numero_rodada)`). Be careful when writing migrations or supplementary queries — preserve these relationships.
- SQL in `app/main.py` is written as multi-line triple-quoted strings and executed via `psycopg` cursors. Follow the same pattern when adding new commands: prepare SQL string, use `with conn.cursor() as cur: cur.execute(sql, params)` and then `fetchone()`/`fetchall()`.
- When parametric queries are required, use the `%s` placeholder style as used in `consulta_tudo_de_uma_partida`.

**Common pitfalls to avoid (observed from repo)**
- Re-running DB init without removing the `postgres_data` volume will not reapply `sql/` scripts. Use `docker compose down -v` to clear.
- The `app` service installs dependencies at container start. Changing `requirements.txt` may require rebuilding or restarting the service.
- The SQL files assume a clean DB and use non-idempotent statements; creating migration-like changes should use `IF NOT EXISTS`/`ALTER TABLE` to be safe.

**Examples Agents can use directly**
- To add a new query handler in `app/main.py`: copy one of the `consulta_*` functions, return results or print them consistently, and add it to `mostrar_menu()` and the `main()` dispatch.
- To inspect data quickly with `psql` from host (DB is on host port 5432):

```powershell
psql "host=localhost port=5432 dbname=futebol user=admin password=admin123"
```

**Where to look for intent / domain knowledge**
- `readme.md` contains the project description and minimundo — use it to keep queries aligned with intended business rules (e.g., how competitions, rounds and participants are modeled).
- `sql/1_schema.sql` and `sql/2_populate.sql` are authoritative for column names, PK/FK structure and seeded examples — prefer them over assumptions.

If anything in this summary is unclear or you want more detail (for example: a recommended code style, unit-test setup, or a different run workflow), tell me what to expand and I will iterate.
