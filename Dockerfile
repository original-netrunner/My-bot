# Use Node 20 (required by Levanter)
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

# Copy package files first (better cache layer)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --network-concurrency 1

# Copy the rest of the source code
COPY . .

# Expose port if the bot uses one (optional)
EXPOSE 3000

# Start the bot with pm2-runtime (keeps container alive)
CMD ["npx", "pm2-runtime", "start", "index.js", "--name", "levanter"]
