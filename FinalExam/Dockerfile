FROM ubuntu:latest

RUN apt-get update && apt-get install -y vim nginx

COPY testScript.sh /testScript.sh

RUN chmod +x /testScript.sh

EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

