FROM sameersbn/squid
RUN apt-get update -y && apt-get install -y apache2-utils
COPY squid.conf /etc/squid3/squid.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh
