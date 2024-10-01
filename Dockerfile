# Use the official Node.js image
FROM node:18-slim

# Set the working directory
WORKDIR /usr/src/app

# Clone the Rendertron repository
RUN git clone https://github.com/GoogleChrome/rendertron.git .

# Install dependencies
RUN npm install

# Expose port 3000 for Rendertron
EXPOSE 3000

# Start the Rendertron service
CMD ["npm", "start"]