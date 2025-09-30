# Docker WordPress + MySQL - Complete CMS Stack

A complete containerized WordPress setup with MySQL database for content management systems.

## 🚀 Features

- WordPress with PHP 8.2 and Apache
- MySQL 8.0 database
- Persistent data volumes
- Environment-based configuration
- Docker Compose multi-service setup
- Kubernetes deployment ready

## 📁 Project Structure

```
docker-wordpress-mysql/
├── docker-compose.yml
├── k8s/
│   ├── mysql-deployment.yaml
│   ├── mysql-service.yaml
│   ├── wordpress-deployment.yaml
│   └── wordpress-service.yaml
└── README.md
```

## 🛠️ Quick Start

### Using Docker Compose

```bash
# Clone the repository
git clone https://github.com/atulkamble/docker-wordpress-mysql.git
cd docker-wordpress-mysql

# Run the stack
docker compose up -d

# Access WordPress
open http://localhost:8081
```

### Using Kubernetes

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/

# Check services
kubectl get services

# Access via NodePort (if using local cluster)
# http://localhost:30081
```

## 🏗️ Configuration

### Docker Compose Setup

The stack includes:
- **WordPress**: `wordpress:php8.2-apache`
- **MySQL**: `mysql:8.0`
- **Persistent Storage**: Named volumes for database

### Default Credentials

- **Database**: wordpress
- **Username**: wp
- **Password**: wp_pass
- **Root Password**: root_pass

> ⚠️ **Important**: Change these credentials for production use!

## 🧪 Testing

```bash
# Check if services are running
docker compose ps

# View logs
docker compose logs wordpress
docker compose logs db

# WordPress setup
# Navigate to http://localhost:8081 and complete WordPress installation
```

## 🔧 Environment Variables

### WordPress Configuration
- `WORDPRESS_DB_HOST`: Database host
- `WORDPRESS_DB_USER`: Database username
- `WORDPRESS_DB_PASSWORD`: Database password
- `WORDPRESS_DB_NAME`: Database name

### MySQL Configuration
- `MYSQL_DATABASE`: Initial database name
- `MYSQL_USER`: MySQL user
- `MYSQL_PASSWORD`: MySQL user password
- `MYSQL_ROOT_PASSWORD`: MySQL root password

## 🚀 Deployment Options

### Local Development
```bash
docker compose up -d
```

### Production (Kubernetes)
```bash
# Create secrets for sensitive data
kubectl create secret generic mysql-secret \
  --from-literal=password=your-secure-password \
  --from-literal=root-password=your-secure-root-password

kubectl apply -f k8s/
```

### Cloud Platforms
- AWS ECS/EKS with RDS
- Azure Container Instances/AKS with Azure Database
- Google Cloud Run/GKE with Cloud SQL

## 💾 Data Persistence

### Docker Compose
- Database data stored in named volume `db_data`
- WordPress files can be persisted by adding volume mount

### Kubernetes
- Use PersistentVolumeClaims for data persistence
- Consider managed database services for production

## 🔒 Security Considerations

1. **Change default passwords**
2. **Use secrets management**
3. **Enable SSL/TLS**
4. **Regular security updates**
5. **Network security policies**

## 📊 Monitoring

### Health Checks
```bash
# Check WordPress
curl -f http://localhost:8081/wp-admin/install.php

# Check MySQL
docker compose exec db mysql -u wp -p -e "SELECT 1"
```

## 🛠️ Maintenance

### Backup
```bash
# Database backup
docker compose exec db mysqldump -u root -p wordpress > backup.sql

# WordPress files backup
docker compose exec wordpress tar -czf /tmp/wp-content.tar.gz /var/www/html/wp-content
```

### Updates
```bash
# Update images
docker compose pull
docker compose up -d
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
**GitHub**: [atulkamble/docker-wordpress-mysql](https://github.com/atulkamble/docker-wordpress-mysql)