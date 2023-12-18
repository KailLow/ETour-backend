FROM node:lts-alpine

ARG NODE_ENV
ARG MONGO_URL
ARG PORT
ARG CORS_URL
ARG LOG_DIR
ARG TZ
ARG DB_MIN_POOL_SIZE
ARG DB_MAX_POOL_SIZE
ARG ACCESS_TOKEN_VALIDITY_SEC
ARG REFRESH_TOKEN_VALIDITY_SEC
ARG TOKEN_ISSUER
ARG TOKEN_AUDIENCE
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG SENDGRID_API_KEY

ENV NODE_ENV=${NODE_ENV}
ENV PORT=${PORT}
ENV CORS_URL=${CORS_URL}
ENV LOG_DIR=${LOG_DIR}
ENV MONGO_URL=${MONGO_URL}
ENV TZ=${TZ}
ENV DB_MIN_POOL_SIZE=${DB_MIN_POOL_SIZE}
ENV DB_MAX_POOL_SIZE=${DB_MAX_POOL_SIZE}
ENV ACCESS_TOKEN_VALIDITY_SEC=${ACCESS_TOKEN_VALIDITY_SEC}
ENV REFRESH_TOKEN_VALIDITY_SEC=${REFRESH_TOKEN_VALIDITY_SEC}
ENV TOKEN_ISSUER=${TOKEN_ISSUER}
ENV TOKEN_AUDIENCE=${TOKEN_AUDIENCE}
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV SENDGRID_API_KEY=${SENDGRID_API_KEY}

USER node

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node . .

RUN npm install

EXPOSE 80

CMD [ "npm", "start" ]