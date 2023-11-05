# Use an official Ubuntu as a base image
FROM ubuntu:latest

# Set environment variables for the internal mirror URL
ENV NPM_CONFIG_REGISTRY=http://internal-mirror-url/npm \
    NODE_VERSION=20

# Update the package index and install required dependencies
RUN apt-get update \
    && apt-get install -y curl

# Download and install Node.js and npm using Node Version Manager (NVM)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && npm install -g npm

# Clean up unnecessary packages and files to reduce the image size
RUN apt-get purge -y --auto-remove curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Verify Node.js and npm installation
RUN node -v && npm -v

# Your application-specific commands go here
# COPY your_app_files /app
# WORKDIR /app
# CMD ["node", "app.js"]
