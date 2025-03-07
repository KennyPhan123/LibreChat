FROM node:20-bullseye-slim

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY bun.lockb ./

# Copy source code and configuration
COPY . .
COPY librechat.yaml /app/librechat.yaml   # Add this line

# Install dependencies and build
RUN npm install
RUN npm run build

# Expose port
EXPOSE 3080

# Start the server
CMD ["npm", "run", "backend"]
