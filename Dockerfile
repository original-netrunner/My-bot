# Use Node.js 20 (required by package.json engines)
FROM node:20-bullseye

# Install system dependencies (ffmpeg is needed for media handling)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /root/bot

# Copy dependency files first (better Docker caching)
COPY package.json yarn.lock* ./

# Install dependencies
RUN yarn install --network-concurrency 1

# Copy the rest of the project
COPY . .

# Expose a port (optional, if bot has a web dashboard)
EXPOSE 3000

# Start the bot with PM2 (as defined in package.json scripts)
CMD ["yarn", "docker"]
