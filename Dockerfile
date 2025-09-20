FROM quay.io/lyfe00011/md:beta

# clone YOUR repo instead of Lyfe’s
RUN git clone https://github.com/original-netrunner/levanter.git/root/LyFE/

WORKDIR /root/LyFE/

# install dependencies
RUN yarn install

# start the bot
CMD ["npm", "start"]

