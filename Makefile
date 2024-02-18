up: 
	docker compose --env-file .env up --build -d

ingest: 
	docker exec elt python ingestion/main.py


# pytest:
# 	docker exec etl python -m pytest -p no:warnings -v


format:
	docker exec elt python -m black -S --line-length 79 .


isort:
	docker exec elt isort .


type:
	docker exec elt mypy --ignore-missing-imports .


lint: 
	docker exec elt flake8 .


ci: isort format type lint pytest


warehouse: 
	winpty docker exec -ti warehouse psql postgres://dorian:1412@localhost:5432/retail_sales

down: 
	docker compose down 