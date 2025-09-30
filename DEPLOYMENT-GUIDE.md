# 🚀 Docker Build Projects Pack - Deployment Guide

## Step 1: Test Local Deployment

Test each project locally with Docker Compose:

```bash
# Test each project individually
cd docker-hello-world && docker compose up -d && curl http://localhost:80 && docker compose down && cd ..
cd docker-flask-app && docker compose up -d && curl http://localhost:5000 && docker compose down && cd ..
cd docker-node-api && docker compose up -d && curl http://localhost:3000 && docker compose down && cd ..
cd docker-springboot-app && docker compose up -d && sleep 30 && curl http://localhost:8080 && docker compose down && cd ..
cd docker-wordpress-mysql && docker compose up -d && sleep 20 && curl -I http://localhost:8081 && docker compose down && cd ..
cd docker-react-node-app && docker compose up -d && sleep 15 && curl http://localhost:8082 && docker compose down && cd ..
cd docker-flask-postgres && docker compose up -d && sleep 10 && curl http://localhost:5001 && docker compose down && cd ..
cd docker-jenkins-server && docker compose up -d && sleep 30 && curl -I http://localhost:8083 && docker compose down && cd ..
cd docker-prometheus-grafana && docker compose up -d && curl http://localhost:9090 && docker compose down && cd ..
cd docker-elk-stack && docker compose up -d && sleep 30 && curl http://localhost:9200 && docker compose down && cd ..
```

## Step 2: Build and Push Docker Images

For projects with custom Dockerfiles, build and push to Docker Hub:

```bash
# Login to Docker Hub
docker login

# Build and push each project
cd docker-hello-world
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-hello-world:latest --push .
cd ../docker-flask-app
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-flask-app:latest --push .
cd ../docker-node-api
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-node-api:latest --push .
cd ../docker-springboot-app
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-springboot-app:latest --push .

# React + Node app (has two images)
cd ../docker-react-node-app/api
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-react-node-api:latest --push .
cd ../client
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-react-node-client:latest --push .

# Flask + PostgreSQL
cd ../../docker-flask-postgres/web
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-flask-postgres-web:latest --push .

# Jenkins
cd ../../docker-jenkins-server
docker buildx build --platform linux/amd64,linux/arm64 -t atuljkamble/docker-jenkins-server:latest --push .

cd ..
```

## Step 3: Create GitHub Repositories

Create separate GitHub repositories for each project:

```bash
# For each project directory:
for project in docker-hello-world docker-flask-app docker-node-api docker-springboot-app docker-wordpress-mysql docker-react-node-app docker-flask-postgres docker-jenkins-server docker-prometheus-grafana docker-elk-stack; do
  echo "Setting up repository for $project"
  cd $project
  git init
  git add .
  git commit -m "init: $project with docker compose + k8s"
  git branch -M main
  
  # Create repo using GitHub CLI (if available)
  if command -v gh &> /dev/null; then
    gh repo create atulkamble/$project --public --description "Docker containerized $project with Kubernetes support"
    git remote add origin https://github.com/atulkamble/$project.git
    git push -u origin main
  else
    echo "Manually create repository: https://github.com/atulkamble/$project"
    echo "Then run: git remote add origin https://github.com/atulkamble/$project.git"
    echo "         git push -u origin main"
  fi
  
  cd ..
done
```

## Step 4: Deploy to Kubernetes (Optional)

Deploy all projects to a Kubernetes cluster:

```bash
# Deploy each project to Kubernetes
kubectl apply -f docker-hello-world/k8s/
kubectl apply -f docker-flask-app/k8s/
kubectl apply -f docker-node-api/k8s/
kubectl apply -f docker-springboot-app/k8s/
kubectl apply -f docker-wordpress-mysql/k8s/
kubectl apply -f docker-react-node-app/k8s/
kubectl apply -f docker-flask-postgres/k8s/
kubectl apply -f docker-jenkins-server/k8s/
kubectl apply -f docker-prometheus-grafana/k8s/
kubectl apply -f docker-elk-stack/k8s/

# Check all deployments
kubectl get deployments
kubectl get services
```

## Step 5: Access Applications

After deployment, access each application:

| Application | Local URL | K8s NodePort |
|-------------|-----------|--------------|
| Hello World | http://localhost:80 | http://localhost:30080 |
| Flask API | http://localhost:5000 | http://localhost:30500 |
| Node API | http://localhost:3000 | http://localhost:30300 |
| Spring Boot | http://localhost:8080 | http://localhost:30808 |
| WordPress | http://localhost:8081 | http://localhost:30081 |
| React App | http://localhost:8082 | http://localhost:30082 |
| Flask+PostgreSQL | http://localhost:5001 | http://localhost:30501 |
| Jenkins | http://localhost:8083 | http://localhost:30083 |
| Prometheus | http://localhost:9090 | http://localhost:30090 |
| Grafana | http://localhost:3001 | http://localhost:30301 |
| Elasticsearch | http://localhost:9200 | N/A |
| Kibana | http://localhost:5601 | http://localhost:30561 |

## Step 6: Automated Deployment

Use the provided script for automated deployment:

```bash
# Make script executable
chmod +x build-and-deploy.sh

# Deploy specific project
./build-and-deploy.sh docker-hello-world

# Deploy all projects
./build-and-deploy.sh all
```

## 📦 Docker Hub Images Created

- `atuljkamble/docker-hello-world:latest`
- `atuljkamble/docker-flask-app:latest`
- `atuljkamble/docker-node-api:latest`
- `atuljkamble/docker-springboot-app:latest`
- `atuljkamble/docker-react-node-api:latest`
- `atuljkamble/docker-react-node-client:latest`
- `atuljkamble/docker-flask-postgres-web:latest`
- `atuljkamble/docker-jenkins-server:latest`

## 🎯 Production Considerations

1. **Secrets Management**: Replace hardcoded passwords with secrets
2. **SSL/TLS**: Add HTTPS certificates for production
3. **Resource Limits**: Add CPU/memory limits in Kubernetes
4. **Monitoring**: Set up logging and metrics collection
5. **Backups**: Implement database backup strategies
6. **Security**: Run security scans on images
7. **Updates**: Set up automated image updates

## ✅ Verification Commands

```bash
# Check Docker images
docker images | grep atuljkamble

# Check running containers
docker ps

# Check Kubernetes resources
kubectl get all

# Test all endpoints
curl http://localhost:80      # Hello World
curl http://localhost:5000    # Flask
curl http://localhost:3000    # Node
curl http://localhost:8080    # Spring Boot
curl http://localhost:8081    # WordPress
curl http://localhost:8082    # React
curl http://localhost:5001    # Flask+PostgreSQL
curl http://localhost:8083    # Jenkins
curl http://localhost:9090    # Prometheus
curl http://localhost:3001    # Grafana
curl http://localhost:9200    # Elasticsearch
curl http://localhost:5601    # Kibana
```

🎉 **Congratulations!** You now have 10 production-ready Docker projects with individual GitHub repositories and Docker Hub images!