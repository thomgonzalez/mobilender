FROM nginx:stable-alpine

ARG CONFIG_ROOT=./docker/nginx/prod

RUN rm /etc/nginx/conf.d/default.conf

COPY ${CONFIG_ROOT}/nginx.conf /etc/nginx/
COPY ${CONFIG_ROOT}/conf.d /etc/nginx/conf.d
