# Use Node.js 20 (Debian Bullseye variant for build compatibility)
FROM node:20-bullseye

# Install build tools & ffmpeg (many npm packages like sharp & sqlite need these)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /root/bot

# Copy package.json and yarn.lock first (better caching)
COPY package.json yarn.lock* ./

# Install dependencies
RUN yarn install --network-concurrency 1

# Copy the rest of the bot’s source code
COPY . .

# Expose a port (only needed if your bot has a web dashboard; harmless otherwise)
EXPOSE 3000

# Use PM2 as process manager
CMD ["npm", "start"]
