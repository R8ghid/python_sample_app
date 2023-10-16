# Build Image
FROM    python:3.11-slim-bullseye as builder

ARG     GIT_ACCESS_TOKEN

COPY    requirements.txt /tmp

RUN     python -m venv /opt/venv
ENV     PATH="/opt/venv/bin:$PATH"

# Install git
RUN     apt-get update && \
        apt-get -y install git && \
        apt-get clean && \
        git config --global url."https://${GIT_ACCESS_TOKEN}@github.com".insteadOf "https://github.com" && \
        pip install --upgrade pip && \
        pip install --no-cache-dir -r /tmp/requirements.txt

# Run image
FROM    python:3.11-slim-bullseye

# Create limited rights user "python"
RUN     mkdir -p /srv/ && \
        addgroup --gid 9999 python && \
        adduser --system --gid 9999 -uid 9999 python && \
        chown python /srv/

# update environment variables
WORKDIR /srv/
ENV     PYTHONPATH /srv/
ENV     PATH="/opt/venv/bin:$PATH"

# Copy python pacakges from builder
COPY    --from=builder /opt/venv /opt/venv

# Copy server code
COPY    data_service /srv/data_service
COPY    alembic.ini /srv/alembic.ini
COPY    migrations /srv/migrations

CMD     python3 data_service/run.py
USER    python