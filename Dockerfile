FROM node:20-bullseye

RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone your main repo into /app
RUN git clone https://github.com/original-netrunner/levanter.git . 

RUN yarn install --network-concurrency 1

EXPOSE 3000

CMD ["npx", "pm2-runtime", "start", "index.js", "--name", "levanter"]
