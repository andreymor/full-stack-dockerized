FROM nginx:alpine

# Maintainer
MAINTAINER Andrey Moretti <andreymor@gmail.com>

COPY web.conf /etc/nginx/conf.d/default.conf

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

#COPY api.conf /etc/nginx/conf.d/api.conf

RUN chown -R nginx /etc/nginx

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
#COPY --from=frontbuilder /frontend/dist /usr/share/nginx/html
#CMD ["/bin/sh", "-l"]
CMD ["nginx", "-g", "daemon off;"]