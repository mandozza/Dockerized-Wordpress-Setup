#!/bin/bash

# Function to update /etc/hosts file
update_hosts_file() {
    local url="$1"
    echo "Updating /etc/hosts file..."
    sudo sed -i "/$url/d" /etc/hosts  # Remove existing entries for the URL
    sudo sh -c "echo '127.0.0.1 $url' >> /etc/hosts"  # Add the new entry
    echo "Hosts file updated with $url"
}

# Function to update Docker Compose configuration
update_docker_compose() {
    local url="$1"
    echo "Updating Docker Compose configuration..."
    sed -i.bak "s|##WORDPRESS_URL##|$url|g" docker-compose.yml
    rm docker-compose.yml.bak  # Remove the backup file created by sed
    echo "Docker Compose configuration updated with $url"
}

# Main script
read -p "Enter desired .test URL (e.g., wordpress.test): " desired_url

# Update /etc/hosts file
update_hosts_file "$desired_url"

# Update Docker Compose configuration
update_docker_compose "$desired_url"

# Restart Docker containers
docker-compose down
docker-compose up -d

echo "Your site is now accessible at http://$desired_url/"
