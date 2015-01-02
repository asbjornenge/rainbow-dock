FROM node:0.11
RUN npm install -g rainbow-dns
ENTRYPOINT ["rainbow-dns"]
