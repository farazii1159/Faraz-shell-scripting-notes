#!/bin/bash

# Deploy a Django app and handle errors

# Function to clone the Django app code
code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists. Skipping clone."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Uncomment the following lines if needed:
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}

# Function to deploy the Django app
deploy() {
    echo "Building and deploying the Django app..."
    docker build -t notes-app . && docker-compose up -d || {
        echo "Failed to build and deploy the app."
        return 1
    }
}

# Main deployment script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
if ! code_clone; then
    cd django-notes-app || exit 1
fi

# Install dependencies
if ! install_requirements; then
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"

# PROJECT 1
# ISKO HUM AWS EC2 MY DEPLOY KRAIN GY

# Ye ek advanced Bash shell scripting project hai jo Docker aur Nginx ki help se Django application ko automatically deploy karne
# ke liye banaya gaya hai. Script `#!/bin/bash` se start hoti hai jo batata hai ke code Bash shell me execute hoga.
# Isme multiple functions use kiye gaye hain jaise `code_clone()` GitHub repository ko clone karne ke liye, `install_requirements()`
# required packages jaise `docker.io`, `nginx`, aur `docker-compose` install karne ke liye, `required_restarts()` Docker socket
# permissions aur services manage karne ke liye, aur `deploy()` Docker image build karke container ko run karne ke liye. Script me 
# error handling bhi implement ki gayi hai jahan `||` operator aur `return 1` use karke failures ko detect kiya jata hai.
# `if ! function_name; then` conditions check karti hain ke agar koi step fail ho jaye to script immediately stop ho jaye aur error
# message show kare. `docker build -t notes-app .` Docker image create karta hai jabke `docker-compose up -d` application ko background
# me run karta hai. Ye project Bash scripting, automation, DevOps deployment, Docker containerization aur Linux administration concepts 
# ko practical aur professional way me demonstrate karta hai.
