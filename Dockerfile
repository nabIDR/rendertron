# Use the official Node.js image
FROM node:18-slim

# Install required libraries for Chromium
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    wget \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \  # Added for libatk-bridge-2.0.so.0
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libgconf-2-4 \
    libglib2.0-0 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libxshmfence1 \
    fonts-noto-color-emoji \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Clone the Rendertron repository
RUN git clone https://github.com/GoogleChrome/rendertron.git .

# Install dependencies
RUN npm install

# Install TypeScript globally (if not available in local dependencies)
RUN npm install -g typescript

# Build the application
RUN npm run build

# Expose port 3000 for Rendertron
EXPOSE 3000

# Start the Rendertron service
CMD ["npm", "start"]
