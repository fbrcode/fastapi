FROM python:3.10-slim-buster

ENV POETRY_VERSION=1.3.2

RUN apt-get update && \
apt-get install -y --no-install-recommends curl vim && \
pip install poetry==$POETRY_VERSION && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

WORKDIR /app/

COPY ["pyproject.toml", "poetry.lock", "CHANGELOG.md", "LICENSE", "README.md", "/app/"]
COPY ./api /app/api

RUN poetry config virtualenvs.create false
RUN poetry install

ENTRYPOINT [ "poetry" ]
CMD [ "run", "uvicorn", "api.app:app", "--host", "0.0.0.0", "--port", "8000",  "--reload" ]
