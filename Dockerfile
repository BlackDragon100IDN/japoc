FROM node:6.10-alpine

COPY . /app
RUN cd /app && \
    npm install && \
    npm run build && \
    rm -rf /app/node_modules

FROM nginx:1.12-alpine

COPY --from=0 /app/dist/ /usr/share/nginx/html/
