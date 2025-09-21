# Base image (Lyfe’s image already has Node.js + Puppeteer deps)
FROM quay.io/lyfe00011/md:beta

# Install required system packages for WhatsApp bots

# Clone your repo into /root/bot
RUN git clone https://github.com/original-netrunner/levanter.git /root/bot

# Set working directory
WORKDIR /root/bot

# Install Node.js dependencies
RUN yarn install 

# Expose a port if your bot has a web dashboard (optional)
# EXPOSE 3000

# Default command to start the bot
CMD ["node", "lib/client.js"]

