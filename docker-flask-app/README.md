# Docker Flask App - Python Web API

A simple containerized Flask web application demonstrating Python web development with Docker.

## 🚀 Features

- Python 3.11 slim base image
- Flask web framework
- RESTful API endpoint
- Docker Compose setup
- Kubernetes deployment ready
- Production-ready container configuration

## 📁 Project Structure

```
docker-flask-app/
├── Dockerfile
├── requirements.txt
├── app.py
├── docker-compose.yml
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
└── README.md
```

## 🛠️ Quick Start

### Using Docker Compose

```bash
# Clone the repository
git clone https://github.com/atulkamble/docker-flask-app.git
cd docker-flask-app

# Run with Docker Compose
docker compose up -d

# Test the API
curl http://localhost:5000
```

### Using Docker directly

```bash
# Build the image
docker build -t atuljkamble/docker-flask-app:latest .

# Run the container
docker run -d -p 5000:5000 atuljkamble/docker-flask-app:latest
```

### Using Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Check the service
kubectl get services

# Access via NodePort (if using local cluster)
# http://localhost:30500
```

## 🏗️ Build & Push to Docker Hub

```bash
# Build multi-platform image
docker buildx build --platform linux/amd64,linux/arm64 \
  -t atuljkamble/docker-flask-app:latest \
  -t atuljkamble/docker-flask-app:v1.0.0 \
  --push .
```

## 🧪 Testing

```bash
# Test the API endpoint
curl http://localhost:5000

# Expected response:
# {"message":"Hello from Flask in Docker 🐳"}
```

## 🔧 Configuration

- **Port**: 5000 (HTTP)
- **Base Image**: python:3.11-slim
- **Framework**: Flask 3.0.3
- **Environment**: Production-ready with proper host binding

## 📦 Docker Image

- **Registry**: Docker Hub
- **Repository**: `atuljkamble/docker-flask-app`
- **Tags**: `latest`, `v1.0.0`

## 🚀 Deployment Options

### Local Development
```bash
# With auto-reload for development
docker run -d -p 5000:5000 -v $(pwd):/app atuljkamble/docker-flask-app:latest
```

### Production (Kubernetes)
```bash
kubectl apply -f k8s/
```

### Cloud Platforms
- AWS ECS/EKS
- Azure Container Instances/AKS
- Google Cloud Run/GKE

## 🔧 Environment Variables

The application can be configured using environment variables:

- `FLASK_ENV`: Set to `development` for development mode
- `FLASK_DEBUG`: Set to `1` for debug mode

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 🌟 Cloudnautic

Part of the Docker Build Projects Pack by Cloudnautic - Ready-to-deploy containerized applications.

---

**Author**: Atul Kamble  
**Docker Hub**: [atuljkamble/docker-flask-app](https://hub.docker.com/r/atuljkamble/docker-flask-app)  
**GitHub**: [atulkamble/docker-flask-app](https://github.com/atulkamble/docker-flask-app)