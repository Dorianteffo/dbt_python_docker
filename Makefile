up: 
	docker compose --env-file .env up --build -d

ingest: 
	docker exec elt python ingestion/pipeline.py


# pytest:
# 	docker exec etl python -m pytest -p no:warnings -v

dbt-debug: 
	winpty docker exec -it elt bash -c "cd dbt && dbt debug"

dbt-test: 
	winpty docker exec -it elt bash -c "cd dbt && dbt test"

dbt-run: 
	winpty docker exec -it elt bash -c "cd dbt && dbt run"

dbt-deps: 
	winpty docker exec -it elt bash -c "cd dbt && dbt deps"

format:
	docker exec elt python -m black -S --line-length 79 .


isort:
	docker exec elt isort .


type:
	docker exec elt mypy --ignore-missing-imports .


lint: 
	docker exec elt flake8 .


ci: isort format type lint #pytest


warehouse: 
	winpty docker exec -ti warehouse psql postgres://dorian:1412@localhost:5432/retail_sales

down: 
	docker compose down 