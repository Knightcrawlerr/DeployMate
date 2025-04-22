#!/bin/bash

# Exit on error
set -e

# Run database migrations
python manage.py migrate

# Create superuser if not exists
python manage.py createsuperuser --noinput || true

# Start server
python manage.py runserver 0.0.0.0:8000
