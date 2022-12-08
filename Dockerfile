FROM ubuntu as build-steps
COPY . /app

from nginx
copy --from=build-steps /app /usr/share/nginx/html
