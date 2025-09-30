# Docker Spring Boot App - Java REST API

A containerized Spring Boot application demonstrating Java enterprise development with Docker.

## 🚀 Features

- Multi-stage Docker build
- Java 21 with Eclipse Temurin
- Spring Boot 3.x framework
- Maven build system
- Production-ready JAR packaging
- Kubernetes deployment ready

## 📁 Project Structure

```
docker-springboot-app/
├── Dockerfile
├── pom.xml
├── src/main/java/com/cloudnautic/demo/DemoApplication.java
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
git clone https://github.com/atulkamble/docker-springboot-app.git
cd docker-springboot-app

# Run with Docker Compose
docker compose up -d

# Test the API
curl http://localhost:8080
```

### Using Docker directly

```bash
# Build the image (takes a few minutes due to Maven dependencies)
docker build -t atuljkamble/docker-springboot-app:latest .

# Run the container
docker run -d -p 8080:8080 atuljkamble/docker-springboot-app:latest
```

### Using Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Check the service
kubectl get services

# Access via NodePort (if using local cluster)
# http://localhost:30808
```

## 🏗️ Build & Push to Docker Hub

```bash
# Build multi-platform image
docker buildx build --platform linux/amd64,linux/arm64 \
  -t atuljkamble/docker-springboot-app:latest \
  -t atuljkamble/docker-springboot-app:v1.0.0 \
  --push .
```

## 🧪 Testing

```bash
# Test the API endpoint
curl http://localhost:8080

# Expected response: Spring Boot welcome page or JSON response
```

## 🔧 Configuration

- **Port**: 8080 (HTTP)
- **Base Image**: eclipse-temurin:21-jre (runtime), maven:3.9-eclipse-temurin-21 (build)
- **Framework**: Spring Boot 3.x
- **Build Tool**: Maven 3.9

## 📦 Docker Image

- **Registry**: Docker Hub
- **Repository**: `atuljkamble/docker-springboot-app`
- **Tags**: `latest`, `v1.0.0`

## 🚀 Deployment Options

### Local Development
```bash
# With Maven for development
mvn spring-boot:run
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

- `SERVER_PORT`: Server port (default: 8080)
- `SPRING_PROFILES_ACTIVE`: Active Spring profiles

## ⚡ Performance

- Multi-stage build reduces final image size
- JRE-only runtime for optimal performance
- Maven dependency caching for faster builds

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
**Docker Hub**: [atuljkamble/docker-springboot-app](https://hub.docker.com/r/atuljkamble/docker-springboot-app)  
**GitHub**: [atulkamble/docker-springboot-app](https://github.com/atulkamble/docker-springboot-app)