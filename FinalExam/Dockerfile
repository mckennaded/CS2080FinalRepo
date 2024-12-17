FROM ubuntu:latest

RUN apt-get update && apt-get install -y vim nginx

COPY script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


