# DeployMate
DeployMate is a Django-based web application designed for practicing DevOps deployment and automation skills.

---

## Getting Started

### Prerequisites

- Python 3.9+
- Docker (for containerized deployment)

---

### Local Development

```bash
git clone https://github.com/Knightcrawlerr/deploymate.git
cd deploymate

python -m venv venv
source venv/bin/activate

pip install -r requirements.txt

python manage.py migrate
python manage.py createsuperuser

python manage.py runserver
```

Visit: `http://localhost:8000`

---

### Docker Setup

```bash
docker build -t deploymate .
docker run -e DJANGO_SUPERUSER_PASSWORD=yourpassword deploymate -p 8000:8000
```

---

## Environment Variables

You can configure these (especially when deploying):

- `DJANGO_SUPERUSER_USERNAME`
- `DJANGO_SUPERUSER_PASSWORD`
- `DJANGO_SUPERUSER_EMAIL`

---

