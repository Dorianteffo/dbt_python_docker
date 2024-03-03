up: 
	docker compose --env-file .env up --build -d

ingest: 
	docker exec elt python ingestion/pipeline.py


dbt-debug: 
	winpty docker exec -it elt bash -c "cd dbt && dbt debug"


dbt-test: 
	winpty docker exec -it elt bash -c "cd dbt && dbt test"


dbt-run: 
	winpty docker exec -it elt bash -c "cd dbt && dbt run"


dbt-deps: 
	winpty docker exec -it elt bash -c "cd dbt && dbt deps"


dbt-deploy: 
	winpty docker exec -it elt bash -c "cd dbt && dbt run --target prod"


format:
	docker exec elt python -m black -S --line-length 79 ingestion


pytest:
	docker exec elt python -m pytest tests -p no:warnings -v


isort:
	docker exec elt isort ingestion

type:
	docker exec elt mypy --ignore-missing-imports ingestion


lint: 
	docker exec elt flake8 ingestion


ci: isort format type lint pytest


warehouse: 
	winpty docker exec -ti warehouse psql postgres://dorian:1412@localhost:5432/retail_sales


down: 
	docker compose down 