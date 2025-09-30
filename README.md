# Docker Build Projects Pack — Cloudnautic

A comprehensive collection of 10 ready-to-deploy Docker projects with **Dockerfiles**, **docker-compose.yml**, and **Kubernetes YAML** configurations. Each project is tagged for **Docker Hub: `atuljkamble`** and GitHub repositories use **`atulkamble`**.

## 🚀 Quick Start

Clone any project and deploy immediately with Docker Compose or Kubernetes!

```bash
# Clone the entire pack
git clone https://github.com/atulkamble/docker-compose-pack.git
cd docker-compose-pack

# Deploy a specific project
cd docker-hello-world
docker compose up -d

# Or deploy all projects
./build-and-deploy.sh all
```

## 📦 Project Collection

| Project | Description | Ports | Tech Stack |
|---------|-------------|-------|------------|
| **[docker-hello-world](./docker-hello-world)** | Nginx static site | 80 | Nginx + HTML |
| **[docker-flask-app](./docker-flask-app)** | Python Flask API | 5000 | Python + Flask |
| **[docker-node-api](./docker-node-api)** | Node.js Express API | 3000 | Node.js + Express |
| **[docker-springboot-app](./docker-springboot-app)** | Java Spring Boot API | 8080 | Java + Spring Boot |
| **[docker-wordpress-mysql](./docker-wordpress-mysql)** | WordPress CMS | 8081 | WordPress + MySQL |
| **[docker-react-node-app](./docker-react-node-app)** | Full-stack React+Node | 8082, 3000 | React + Node.js + Nginx |
| **[docker-flask-postgres](./docker-flask-postgres)** | Flask with PostgreSQL | 5001 | Python + Flask + PostgreSQL |
| **[docker-jenkins-server](./docker-jenkins-server)** | Jenkins CI/CD | 8083 | Jenkins + Docker |
| **[docker-prometheus-grafana](./docker-prometheus-grafana)** | Monitoring stack | 9090, 3001 | Prometheus + Grafana |
| **[docker-elk-stack](./docker-elk-stack)** | Logging stack | 9200, 5601 | Elasticsearch + Kibana |

## 🛠️ Features

✅ **Production-ready Dockerfiles**  
✅ **Multi-platform builds** (AMD64 + ARM64)  
✅ **Docker Compose configurations**  
✅ **Kubernetes YAML manifests**  
✅ **Automated build script**  
✅ **Comprehensive documentation**  
✅ **Security best practices**  
✅ **Performance optimized**  

## 🏗️ Build & Deploy Script

Use the included script to build, test, and deploy projects:

```bash
# Make script executable
chmod +x build-and-deploy.sh

# Deploy a specific project
./build-and-deploy.sh docker-hello-world

# Deploy all projects
./build-and-deploy.sh all

# Available commands:
./build-and-deploy.sh docker-hello-world
./build-and-deploy.sh docker-flask-app
./build-and-deploy.sh docker-node-api
./build-and-deploy.sh docker-springboot-app
./build-and-deploy.sh docker-wordpress-mysql
./build-and-deploy.sh docker-react-node-app
./build-and-deploy.sh docker-flask-postgres
./build-and-deploy.sh docker-jenkins-server
./build-and-deploy.sh docker-prometheus-grafana
./build-and-deploy.sh docker-elk-stack
```

## 🐳 Docker Images

All images are available on Docker Hub:

- `atuljkamble/docker-hello-world`
- `atuljkamble/docker-flask-app`
- `atuljkamble/docker-node-api`
- `atuljkamble/docker-springboot-app`
- `atuljkamble/docker-react-node-api`
- `atuljkamble/docker-react-node-client`
- `atuljkamble/docker-flask-postgres-web`
- `atuljkamble/docker-jenkins-server`

## ☸️ Kubernetes Deployment

Each project includes Kubernetes manifests:

```bash
# Deploy to Kubernetes
kubectl apply -f docker-hello-world/k8s/
kubectl apply -f docker-flask-app/k8s/
# ... etc

# Or deploy all at once
find . -name "k8s" -type d -exec kubectl apply -f {} \\;
```

## 🌐 Access URLs

After deployment with Docker Compose:

| Service | URL | Description |
|---------|-----|-------------|
| Nginx Static | http://localhost:80 | Hello World page |
| Flask API | http://localhost:5000 | Python API |
| Node API | http://localhost:3000 | Express API |
| Spring Boot | http://localhost:8080 | Java API |
| WordPress | http://localhost:8081 | CMS Admin |
| React App | http://localhost:8082 | React Frontend |
| Flask+PostgreSQL | http://localhost:5001 | Python+DB API |
| Jenkins | http://localhost:8083 | CI/CD Server |
| Prometheus | http://localhost:9090 | Metrics |
| Grafana | http://localhost:3001 | Dashboards |
| Elasticsearch | http://localhost:9200 | Search Engine |
| Kibana | http://localhost:5601 | Log Analytics |

## 📋 Prerequisites

- **Docker** 20.10+ with Buildx
- **Docker Compose** 2.0+
- **Kubernetes** (optional)
- **GitHub CLI** (optional, for repo creation)

## 🚀 Cloud Deployment

### AWS
```bash
# ECS
aws ecs create-cluster --cluster-name docker-projects

# EKS
eksctl create cluster --name docker-projects-cluster
```

### Azure
```bash
# Container Instances
az container create --resource-group myRG --name myapp

# AKS
az aks create --resource-group myRG --name docker-projects-aks
```

### Google Cloud
```bash
# Cloud Run
gcloud run deploy --image atuljkamble/docker-hello-world

# GKE
gcloud container clusters create docker-projects-cluster
```

## 🔧 Customization

Each project can be customized by:

1. **Environment Variables**: Check each project's README
2. **Docker Compose Overrides**: Use `docker-compose.override.yml`
3. **Kubernetes ConfigMaps**: For configuration management
4. **Custom Dockerfiles**: Modify base images or add dependencies

## 📊 Project Stats

- **Total Projects**: 10
- **Docker Images**: 8 custom + 4 official
- **Technologies**: 12 different stacks
- **Kubernetes Manifests**: 20+ YAML files
- **Documentation**: 10 detailed READMEs

## 🔒 Security

- Non-root users where applicable
- Minimal base images (Alpine Linux)
- No hardcoded secrets in production
- Security scanning compatible
- HTTPS/TLS ready configurations

## 🎯 Use Cases

- **Learning Docker & Kubernetes**
- **Microservices Architecture**
- **CI/CD Pipeline Examples**
- **Full-stack Development**
- **DevOps Practice Projects**
- **Production Deployments**

## 🤝 Contributing

1. Fork any individual project repository
2. Create a feature branch
3. Test with Docker Compose and Kubernetes
4. Submit a Pull Request

## 📄 License

All projects are licensed under the MIT License.

## 🌟 Individual GitHub Repositories

Each project has its own repository:

- [docker-hello-world](https://github.com/atulkamble/docker-hello-world)
- [docker-flask-app](https://github.com/atulkamble/docker-flask-app)
- [docker-node-api](https://github.com/atulkamble/docker-node-api)
- [docker-springboot-app](https://github.com/atulkamble/docker-springboot-app)
- [docker-wordpress-mysql](https://github.com/atulkamble/docker-wordpress-mysql)
- [docker-react-node-app](https://github.com/atulkamble/docker-react-node-app)
- [docker-flask-postgres](https://github.com/atulkamble/docker-flask-postgres)
- [docker-jenkins-server](https://github.com/atulkamble/docker-jenkins-server)
- [docker-prometheus-grafana](https://github.com/atulkamble/docker-prometheus-grafana)
- [docker-elk-stack](https://github.com/atulkamble/docker-elk-stack)

## 📞 Support

- **Documentation**: Each project includes detailed README
- **Issues**: Report on individual project repositories
- **Discussions**: Use GitHub Discussions
- **Updates**: Watch repositories for updates

---

**Created by**: Atul Kamble | **Cloudnautic**  
**Docker Hub**: [atuljkamble](https://hub.docker.com/u/atuljkamble)  
**GitHub**: [atulkamble](https://github.com/atulkamble)

> 🎯 **Ready to deploy!** Pick any project, copy to a new repo, and launch your containerized application in minutes!