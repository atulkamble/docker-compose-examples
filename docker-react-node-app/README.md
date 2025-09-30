# Docker React + Node App - Full Stack Application

A complete full-stack application with React frontend and Node.js API backend, containerized with Docker.

## 🚀 Features

- React 18 frontend with Vite build tool
- Node.js Express API backend
- Multi-stage Docker builds
- Nginx for production React serving
- Separate frontend and backend containers
- Docker Compose orchestration
- Kubernetes deployment ready

## 📁 Project Structure

```
docker-react-node-app/
├── client/
│   ├── Dockerfile
│   ├── package.json
│   ├── src/App.jsx
│   ├── index.html
│   └── vite.config.js
├── api/
│   ├── Dockerfile
│   ├── package.json
│   └── server.js
├── docker-compose.yml
├── k8s/
│   ├── api-deployment.yaml
│   ├── api-service.yaml
│   ├── client-deployment.yaml
│   └── client-service.yaml
└── README.md
```

## 🛠️ Quick Start

### Using Docker Compose

```bash
# Clone the repository
git clone https://github.com/atulkamble/docker-react-node-app.git
cd docker-react-node-app

# Run the full stack
docker compose up -d

# Access the application
open http://localhost:8082  # React frontend
open http://localhost:3000  # Node.js API
```

### Using Docker directly

```bash
# Build and run API
cd api
docker build -t atuljkamble/docker-react-node-api:latest .
docker run -d -p 3000:3000 atuljkamble/docker-react-node-api:latest

# Build and run Client
cd ../client
docker build -t atuljkamble/docker-react-node-client:latest .
docker run -d -p 8082:80 atuljkamble/docker-react-node-client:latest
```

### Using Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Check services
kubectl get services

# Access via NodePort
# Frontend: http://localhost:30082
# API: http://localhost:30300
```

## 🏗️ Build & Push to Docker Hub

```bash
# Build API image
cd api
docker buildx build --platform linux/amd64,linux/arm64 \
  -t atuljkamble/docker-react-node-api:latest \
  -t atuljkamble/docker-react-node-api:v1.0.0 \
  --push .

# Build Client image
cd ../client
docker buildx build --platform linux/amd64,linux/arm64 \
  -t atuljkamble/docker-react-node-client:latest \
  -t atuljkamble/docker-react-node-client:v1.0.0 \
  --push .
```

## 🧪 Testing

```bash
# Test API endpoint
curl http://localhost:3000

# Expected API response:
# {"api":"ok","msg":"Hello from API"}

# Test React frontend
curl http://localhost:8082

# Expected: HTML page with React app
```

## 🔧 Configuration

### API Configuration
- **Port**: 3000
- **Framework**: Express.js
- **Base Image**: node:22-alpine

### Client Configuration
- **Port**: 80 (Nginx)
- **Framework**: React 18 + Vite
- **Build**: Multi-stage (Node.js build + Nginx serve)

## 📦 Docker Images

- **API**: `atuljkamble/docker-react-node-api`
- **Client**: `atuljkamble/docker-react-node-client`

## 🚀 Deployment Options

### Local Development
```bash
# Development mode with hot reload
cd client && npm run dev
cd api && npm run dev
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

### API Configuration
- `PORT`: API server port (default: 3000)
- `NODE_ENV`: Environment mode

### Client Configuration
- Build-time variables in `vite.config.js`
- Runtime configuration via environment

## ⚡ Performance

### Frontend
- Vite for fast builds and hot reload
- Multi-stage build for optimized production image
- Nginx for efficient static file serving

### Backend
- Alpine Linux for minimal image size
- Express.js for lightweight API framework
- Production-only dependencies

## 🛠️ Development

### Frontend Development
```bash
cd client
npm install
npm run dev
```

### Backend Development
```bash
cd api
npm install
npm run dev
```

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
**Docker Hub**: [atuljkamble/docker-react-node-api](https://hub.docker.com/r/atuljkamble/docker-react-node-api), [atuljkamble/docker-react-node-client](https://hub.docker.com/r/atuljkamble/docker-react-node-client)  
**GitHub**: [atulkamble/docker-react-node-app](https://github.com/atulkamble/docker-react-node-app)