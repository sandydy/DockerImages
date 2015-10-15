# Using a compact OS
FROM mobtitude/vpn-pptp:latest
MAINTAINER	Sandy Chan <sandydy.chan@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY ./chap-secrets /etc/ppp/chap-secrets
COPY ./pptpd-options /etc/ppp/pptpd-options
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 0700 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]

EXPOSE 1723