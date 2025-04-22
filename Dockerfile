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
COPY entrypoint.sh /app/

# Make entrypoint script executable 
RUN chmod +x /app/entrypoint.sh

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
ENTRYPOINT ["/app/entrypoint.sh"]
