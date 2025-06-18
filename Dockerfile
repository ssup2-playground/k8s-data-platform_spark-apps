FROM python:3.11-slim
COPY --from=ghcr.io/astral-sh/uv:0.7.6 /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml pyproject.toml
COPY uv.lock uv.lock
RUN uv sync

COPY ./src/jobs jobs
COPY ./src/utils utils

ENV PATH="/app/.venv/bin:${PATH}"
ENV PYTHONPATH="/app"