# FastAPI release branches

This repository contains the release branches for the FastAPI very basic project.

The `staging` branch is the intermediary protected branch and the `main` branch is the latest stable production release.

Development flow follows `main` -> `staging` -> `feature` -> `staging` -> `main` -> `release`.

Release notes are generated using [Commitizen](https://commitizen-tools.github.io/commitizen/) and [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). They are generated from the `CHANGELOG.md` file.

Standard reinforced conventional commits are enforced using [pre-commit](https://pre-commit.com/). Basically, defined as follows:

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
- `ci`: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

## Requirements

- [Poetry](https://python-poetry.org/docs/#installation)

## Installation

Install the project dependencies:

```sh
poetry install
```

Enforce the pre-commit hooks for conventional commits:

```sh
poetry run pre-commit install --hook-type commit-msg --hook-type pre-push
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

## Testing

Run the tests:

```sh
poetry run pytest ./tests
```

## Docker

Build the docker image:

```sh
docker build -t api-app .
```

Run the docker image as a container:

```sh
docker run --name f-api -p 8888:8000 -d api-app
```

Use docker compose to run the application:

```sh
docker-compose up -d
```

Shutdown with docker compose:

```sh
docker-compose down
```

## Release Versioning

This is a process sequence to release a new version of the project.

```sh
# from staging branch
git checkout -b feat/X
# do all changes and commits
poetry run cz --no-raise 21 bump --yes --changelog --check-consistency
git push origin feat/X
## PR, approve and merge
git checkout staging
git pull
# when ready to release
git push origin staging:main
git checkout main
git pull
echo $(head -1 CHANGELOG.md | awk '{print $2}')
git push origin $(head -1 CHANGELOG.md | awk '{print $2}')
```
