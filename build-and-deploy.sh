#!/bin/bash

# Docker Build Projects Pack - Build and Deploy Script
# Usage: ./build-and-deploy.sh [project-name]

set -e

DOCKER_USERNAME="atuljkamble"
GITHUB_USERNAME="atulkamble"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to build and push Docker image
build_and_push() {
    local project_dir=$1
    local image_name=$2
    
    if [ ! -d "$project_dir" ]; then
        print_error "Project directory $project_dir not found!"
        return 1
    fi
    
    print_status "Building Docker image for $project_dir..."
    cd "$project_dir"
    
    # Build multi-platform image
    docker buildx build --platform linux/amd64,linux/arm64 \
        -t "${DOCKER_USERNAME}/${image_name}:latest" \
        -t "${DOCKER_USERNAME}/${image_name}:v1.0.0" \
        --push .
    
    if [ $? -eq 0 ]; then
        print_success "Successfully built and pushed ${DOCKER_USERNAME}/${image_name}"
    else
        print_error "Failed to build and push ${DOCKER_USERNAME}/${image_name}"
        return 1
    fi
    
    cd ..
}

# Function to create GitHub repository
create_github_repo() {
    local repo_name=$1
    local project_dir=$2
    
    print_status "Setting up GitHub repository for $repo_name..."
    
    cd "$project_dir"
    
    # Initialize git repository
    git init
    git add .
    git commit -m "init: $repo_name with docker compose + k8s"
    git branch -M main
    
    # Create GitHub repository (requires gh CLI)
    if command -v gh &> /dev/null; then
        gh repo create "${GITHUB_USERNAME}/${repo_name}" --public --description "Docker containerized $repo_name with Kubernetes support"
        git remote add origin "https://github.com/${GITHUB_USERNAME}/${repo_name}.git"
        git push -u origin main
        print_success "GitHub repository created: https://github.com/${GITHUB_USERNAME}/${repo_name}"
    else
        print_warning "GitHub CLI not found. Please create repository manually:"
        print_warning "git remote add origin https://github.com/${GITHUB_USERNAME}/${repo_name}.git"
        print_warning "git push -u origin main"
    fi
    
    cd ..
}

# Function to test application
test_application() {
    local project_dir=$1
    local test_url=$2
    
    print_status "Testing application in $project_dir..."
    cd "$project_dir"
    
    # Start with Docker Compose
    docker compose up -d
    
    # Wait for services to be ready
    sleep 10
    
    # Test the application
    if curl -f "$test_url" > /dev/null 2>&1; then
        print_success "Application is responding at $test_url"
    else
        print_warning "Application may not be ready yet at $test_url"
    fi
    
    # Show running containers
    docker compose ps
    
    # Stop services
    docker compose down
    
    cd ..
}

# Main deployment function
deploy_project() {
    local project_name=$1
    
    case $project_name in
        "docker-hello-world")
            build_and_push "$project_name" "docker-hello-world"
            test_application "$project_name" "http://localhost:80"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-flask-app")
            build_and_push "$project_name" "docker-flask-app"
            test_application "$project_name" "http://localhost:5000"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-node-api")
            build_and_push "$project_name" "docker-node-api"
            test_application "$project_name" "http://localhost:3000"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-springboot-app")
            build_and_push "$project_name" "docker-springboot-app"
            test_application "$project_name" "http://localhost:8080"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-wordpress-mysql")
            # WordPress doesn't have a single image to build
            test_application "$project_name" "http://localhost:8081"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-react-node-app")
            cd "$project_name"
            build_and_push "api" "docker-react-node-api"
            build_and_push "client" "docker-react-node-client"
            cd ..
            test_application "$project_name" "http://localhost:8082"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-flask-postgres")
            cd "$project_name"
            build_and_push "web" "docker-flask-postgres-web"
            cd ..
            test_application "$project_name" "http://localhost:5001"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-jenkins-server")
            build_and_push "$project_name" "docker-jenkins-server"
            test_application "$project_name" "http://localhost:8083"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-prometheus-grafana")
            test_application "$project_name" "http://localhost:9090"
            create_github_repo "$project_name" "$project_name"
            ;;
        "docker-elk-stack")
            test_application "$project_name" "http://localhost:9200"
            create_github_repo "$project_name" "$project_name"
            ;;
        "all")
            print_status "Deploying all projects..."
            deploy_project "docker-hello-world"
            deploy_project "docker-flask-app"
            deploy_project "docker-node-api"
            deploy_project "docker-springboot-app"
            deploy_project "docker-wordpress-mysql"
            deploy_project "docker-react-node-app"
            deploy_project "docker-flask-postgres"
            deploy_project "docker-jenkins-server"
            deploy_project "docker-prometheus-grafana"
            deploy_project "docker-elk-stack"
            ;;
        *)
            print_error "Unknown project: $project_name"
            print_status "Available projects:"
            echo "  - docker-hello-world"
            echo "  - docker-flask-app"
            echo "  - docker-node-api"
            echo "  - docker-springboot-app"
            echo "  - docker-wordpress-mysql"
            echo "  - docker-react-node-app"
            echo "  - docker-flask-postgres"
            echo "  - docker-jenkins-server"
            echo "  - docker-prometheus-grafana"
            echo "  - docker-elk-stack"
            echo "  - all"
            exit 1
            ;;
    esac
}

# Check prerequisites
check_prerequisites() {
    print_status "Checking prerequisites..."
    
    # Check Docker
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed!"
        exit 1
    fi
    
    # Check Docker Buildx
    if ! docker buildx version &> /dev/null; then
        print_error "Docker Buildx is not available!"
        exit 1
    fi
    
    # Check if logged into Docker Hub
    if ! docker info | grep -q "Username"; then
        print_warning "Not logged into Docker Hub. Please run: docker login"
    fi
    
    print_success "Prerequisites check completed"
}

# Main script
main() {
    print_status "Docker Build Projects Pack - Build and Deploy Script"
    print_status "Author: Atul Kamble | Cloudnautic"
    echo
    
    check_prerequisites
    
    if [ $# -eq 0 ]; then
        print_error "Please specify a project name or 'all'"
        deploy_project "unknown"
        exit 1
    fi
    
    deploy_project "$1"
    
    print_success "Deployment completed!"
}

# Run main function with all arguments
main "$@"