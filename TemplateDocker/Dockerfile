FROM ubuntu

RUN apt-get update && \
    apt-get install -y vim nginx && \
    apt-get clean

COPY assign7.sh /usr/local/bin/testScript.sh

RUN chmod +x /usr/local/bin/testScript.sh

CMD ["/usr/local/bin/testScript.sh"]
