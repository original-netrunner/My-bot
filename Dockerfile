FROM quay.io/lyfe00011/md:beta

# clone your repo into /root/bot
RUN git clone https://github.com/original-netrunner/levanter.git /root/bot

WORKDIR /root/bot

RUN yarn install

CMD ["npm", "start"]
