# Docker Node API - Express.js REST API

A lightweight containerized Node.js API using Express.js framework.

## 🚀 Features

- Node.js 22 Alpine base image
- Express.js 4.x framework
- ES6 modules support
- Minimal production dependencies
- Docker Compose setup
- Kubernetes deployment ready

## 📁 Project Structure

```
docker-node-api/
├── Dockerfile
├── package.json
├── server.js
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
git clone https://github.com/atulkamble/docker-node-api.git
cd docker-node-api

# Run with Docker Compose
docker compose up -d

# Test the API
curl http://localhost:3000
```

### Using Docker directly

```bash
# Build the image
docker build -t atuljkamble/docker-node-api:latest .

# Run the container
docker run -d -p 3000:3000 atuljkamble/docker-node-api:latest
```

### Using Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Check the service
kubectl get services

# Access via NodePort (if using local cluster)
# http://localhost:30300
```

## 🏗️ Build & Push to Docker Hub

```bash
# Build multi-platform image
docker buildx build --platform linux/amd64,linux/arm64 \
  -t atuljkamble/docker-node-api:latest \
  -t atuljkamble/docker-node-api:v1.0.0 \
  --push .
```

## 🧪 Testing

```bash
# Test the API endpoint
curl http://localhost:3000

# Expected response:
# {"message":"Hello from Node API in Docker 🐳"}
```

## 🔧 Configuration

- **Port**: 3000 (HTTP)
- **Base Image**: node:22-alpine
- **Framework**: Express.js 4.19.2
- **Module System**: ES6 modules

## 📦 Docker Image

- **Registry**: Docker Hub
- **Repository**: `atuljkamble/docker-node-api`
- **Tags**: `latest`, `v1.0.0`

## 🚀 Deployment Options

### Local Development
```bash
# With volume mount for development
docker run -d -p 3000:3000 -v $(pwd):/usr/src/app atuljkamble/docker-node-api:latest
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

- `PORT`: Server port (default: 3000)
- `NODE_ENV`: Environment mode (development/production)

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
**Docker Hub**: [atuljkamble/docker-node-api](https://hub.docker.com/r/atuljkamble/docker-node-api)  
**GitHub**: [atulkamble/docker-node-api](https://github.com/atulkamble/docker-node-api)