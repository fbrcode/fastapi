# Project commands

Command listing to build the project.

```sh
poetry new --name=api -- .
git init
poetry config virtualenvs.in-project true --local
poetry install
poetry add fastapi
poetry add "uvicorn[standard]"
poetry add python-multipart
poetry add sqlalchemy
poetry add jinja2
poetry add black --group dev
poetry add commitizen --group dev
poetry add pre-commit --group dev
pre-commit install --hook-type commit-msg --hook-type pre-push
```

Command to startup the project.

```sh
poetry run uvicorn api.app:app --reload
```

Or using scripts definition:

```sh
poetry run api
```
