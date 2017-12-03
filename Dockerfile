FROM debian

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN apt-get update && apt-get install -y curl python3 python3-dev python3-pip
RUN pip3 install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
