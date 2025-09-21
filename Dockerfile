# Use Node 20
FROM node:20-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy local repo files (with your edits)
COPY . .

# Install dependencies
RUN yarn install --network-concurrency 1

# Expose port if needed
EXPOSE 3000

# Start bot using pm2-runtime
CMD ["pm2-runtime", "start", "index.js", "--name", "levanter"]
