FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off

RUN useradd -m appuser

WORKDIR /webapp
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./webapp /webapp/

RUN chown -R appuser:appuser /webapp
USER appuser

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

ENTRYPOINT ["uvicorn"]
CMD ["--host", "0.0.0.0", "main:app", "--workers", "4"]