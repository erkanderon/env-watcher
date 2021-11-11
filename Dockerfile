FROM nginx:1.21.0
USER root

RUN apt-get update && apt-get install python3 python3-pip -y && pip3 install gunicorn

COPY requirements.txt entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN chmod 777 /requirements.txt
COPY conf/server.conf /etc/nginx/conf.d
COPY conf/proxy_params /etc/nginx/

RUN pip3 install -r /requirements.txt
RUN mkdir -p /Application/webapp

COPY webapp /Application/webapp

WORKDIR /Application/webapp

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
