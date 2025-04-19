FROM python:3.9-slim

# Set environment variables for Django superuser
ENV DJANGO_SUPERUSER_USERNAME=admin \
    DJANGO_SUPERUSER_EMAIL=admin@example.com \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy app code and dependencies
COPY requirements.txt /app/
COPY Deploymate /app/

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get remove -y gcc && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Expose port
EXPOSE 8000

# Run migrations and create superuser automatically, then start the server
CMD ["sh", "-c", "\
    python3 manage.py migrate && \
    python3 manage.py createsuperuser --noinput || true && \
    python3 manage.py runserver 0.0.0.0:8000 \
"]

