# Docker Jenkins Server - CI/CD Pipeline

A containerized Jenkins server with pre-installed plugins for CI/CD pipelines.

## 🚀 Features

- Jenkins LTS with JDK 17
- Pre-installed essential plugins
- Docker-in-Docker capability
- Persistent Jenkins home
- Production-ready configuration

## 🛠️ Quick Start

```bash
git clone https://github.com/atulkamble/docker-jenkins-server.git
cd docker-jenkins-server
docker compose up -d

# Get initial admin password
docker compose logs jenkins | grep "Please use the following password"

# Access Jenkins
open http://localhost:8083
```

## 🔧 Configuration

- **Port**: 8083 (Web UI), 50000 (Agent)
- **Initial Setup**: Use generated admin password
- **Plugins**: Git, Blue Ocean, Pipeline

---

**Docker Hub**: [atuljkamble/docker-jenkins-server](https://hub.docker.com/r/atuljkamble/docker-jenkins-server)  
**GitHub**: [atulkamble/docker-jenkins-server](https://github.com/atulkamble/docker-jenkins-server)