# Use the official Node.js image
FROM node:18-slim

# Install git
RUN apt-get update && apt-get install -y git && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Clone the Rendertron repository
RUN git clone https://github.com/GoogleChrome/rendertron.git .

# Install dependencies
RUN npm install --production

# Build the application
RUN npm run build

# Expose port 3000 for Rendertron
EXPOSE 3000

# Start the Rendertron service
CMD ["npm", "start"]