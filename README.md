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
