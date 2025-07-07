FROM quay.io/lyfe00011/md:beta
RUN git clone https://github.com/lyfe00011/levanter.git /root/LyFE/
WORKDIR /root/LyFE/
RUN yarn install
# Ensure pm2 is installed globally or as a project dependency
# If not already globally installed in the base image or by yarn, you might need:
# RUN npm install -g pm2 # Or yarn global add pm2
CMD ["pm2-runtime", "start", "index.js", "--name", "levanter-app"]
