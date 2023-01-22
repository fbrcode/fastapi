# FastAPI release branches

This repository contains the release branches for the FastAPI project.

The `staging` branch is the intermediary protected branch and the `main` branch is the latest stable production release.

## Requirements

- [Poetry](https://python-poetry.org/docs/#installation)

## Installation

Install the project dependencies:

```sh
poetry install
```

## API Startup

Start the application with uvicorn:

```sh
poetry run uvicorn api.app:app --reload
```

Or using scripts definition:

```sh
poetry run api
```
