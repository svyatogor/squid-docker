#!/bin/bash
set -e

mkdir -p ${SQUID_LOG_DIR}
chmod -R 755 ${SQUID_LOG_DIR}
chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_LOG_DIR}

mkdir -p ${SQUID_CACHE_DIR}
chown -R ${SQUID_USER}:${SQUID_USER} ${SQUID_CACHE_DIR}

$(which squid3) -N -f /etc/squid3/squid.conf -z

echo "Setting up squid ACL"
htpasswd -cb /etc/squid3/passwd $SQUID_USERNAME $SQUID_PASSWORD
chmod o+r /etc/squid/passwd

echo "Starting squid3..."
exec $(which squid3) -f /etc/squid3/squid.conf -NYCd 1 ${EXTRA_ARGS}