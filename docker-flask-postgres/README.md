# Docker Flask + PostgreSQL - Python Web App with Database

A containerized Flask application with PostgreSQL database demonstrating database integration.

## 🚀 Features

- Flask web framework with PostgreSQL
- Environment-based database configuration
- Persistent PostgreSQL data
- Health check endpoints
- Production-ready setup

## 📁 Project Structure

```
docker-flask-postgres/
├── web/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── app.py
├── docker-compose.yml
├── k8s/
│   ├── postgres-deployment.yaml
│   ├── postgres-service.yaml
│   ├── web-deployment.yaml
│   └── web-service.yaml
└── README.md
```

## 🛠️ Quick Start

```bash
# Clone and run
git clone https://github.com/atulkamble/docker-flask-postgres.git
cd docker-flask-postgres
docker compose up -d

# Test the application
curl http://localhost:5001
```

## 🧪 Testing

```bash
# Test database connection
curl http://localhost:5001/health
```

## 🔧 Configuration

- **Web Port**: 5001
- **Database**: PostgreSQL 16
- **Environment Variables**: PGHOST, PGUSER, PGPASSWORD, PGDATABASE

---

**Docker Hub**: [atuljkamble/docker-flask-postgres-web](https://hub.docker.com/r/atuljkamble/docker-flask-postgres-web)  
**GitHub**: [atulkamble/docker-flask-postgres](https://github.com/atulkamble/docker-flask-postgres)