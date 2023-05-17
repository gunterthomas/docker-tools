FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get install -y gearman
RUN apt-get clean

WORKDIR /

EXPOSE 4730

CMD ["/bin/sh", "-c", "gearmand -p 4730 -L 0.0.0.0"]