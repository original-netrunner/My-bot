FROM node:20-bullseye

RUN apt-get update && apt-get install -y \
    ffmpeg \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/bot

# Clone your Levanter repo directly
RUN git clone https://github.com/original-netrunner/levanter.git . 

# Install dependencies
RUN yarn install --network-concurrency 1

# Expose port if needed
EXPOSE 3000

CMD ["yarn", "docker"]
