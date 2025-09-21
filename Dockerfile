FROM node:20-bullseye

RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN yarn install --network-concurrency 1

EXPOSE 3000

# Use npx to run pm2-runtime from node_modules
CMD ["npx", "pm2-runtime", "start", "index.js", "--name", "levanter"]
