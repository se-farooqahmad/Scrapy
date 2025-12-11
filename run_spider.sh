#!/bin/bash

# Define variables
ENV_DIR="scrapy_env"

# Determine the OS and set the activation command
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    ACTIVATE_CMD="$ENV_DIR/Scripts/activate"
else
    ACTIVATE_CMD="$ENV_DIR/bin/activate"
fi

# Check if the virtual environment directory exists
if [ ! -d "$ENV_DIR" ]; then
    echo "Creating virtual environment..."
    # Install virtualenv if not installed
    if ! command -v virtualenv &> /dev/null; then
        echo "Installing virtualenv..."
        pip install virtualenv
    fi

    # Create a virtual environment
    virtualenv $ENV_DIR

    # Activate the virtual environment
    source $ACTIVATE_CMD

    # Install Scrapy
    echo "Installing Scrapy..."
    pip install scrapy
else
    # Activate the virtual environment
    source $ACTIVATE_CMD
fi

# Run the Scrapy spider
scrapy crawl macys-crawl