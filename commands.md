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

## Automated release

Bump version and generate changelog action:

```yml
name: Bump version

on:
  push:
    branches:
      - main

jobs:
  bump-version:
    if: "!startsWith(github.event.head_commit.message, 'bump:')"
    runs-on: ubuntu-latest
    name: "Bump version and create changelog with commitizen"
    steps:
      - name: Check out
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Create bump and changelog
        uses: commitizen-tools/commitizen-action@master
        with:
          github_token: "${{ secrets.GITHUB_TOKEN }}"
          changelog_increment_filename: body.md
      - name: Release
        uses: softprops/action-gh-release@v1
        with:
          body_path: "body.md"
          tag_name: ${{ env.REVISION }}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

Update action settings to enable writing...

Go to:

- <https://github.com/[user]/[repo]/settings>
  - Actions
    - General
    - Workflow permissions
      - Check option: Read and write permissions

## Workflow

```sh
git push origin feature1
# make pull request, merge and delete branch
git checkout staging
git pull
# for release generation
git push origin staging:main
# observe the bump-version action
git checkout main
# apply release changes back to staging
git push origin main:staging
git checkout staging
git pull
```
