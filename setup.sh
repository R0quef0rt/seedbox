#!/bin/bash

SALT_VERSION=${SALT_VERSION}
MINION_TEMPLATE="${MINION_TEMPLATE}"

apt-get update && apt-get install wget git python-dev python-pip -y

git clone --branch v0.6.2 https://github.com/hashicorp/terraform-aws-vault /tmp/terraform-aws-vault

wget -O bootstrap-devbox.sh https://github.com/R0quef0rt/seedbox

mkdir -p /etc/salt/minion.d
echo "${MINION_TEMPLATE}" > /etc/salt/minion.d/custom.conf

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -U -F \
  -i ${MINION_ID} \
  -c /tmp \
  git v${SALT_VERSION}