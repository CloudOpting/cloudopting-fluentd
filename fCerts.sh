export FLUENTD_HOSTNAME=fluentd
export FLUENTD_CERTS_DIR=certs
export CA_PASSWORD=p4ssw0rd

rm -rf ${FLUENTD_CERTS_DIR}

mkdir -p ${FLUENTD_CERTS_DIR}

openssl genrsa -aes256 -passout env:CA_PASSWORD -out ${FLUENTD_CERTS_DIR}/ca_key.pem 4096
openssl req -new -x509 -passin env:CA_PASSWORD -days 365 -key ${FLUENTD_CERTS_DIR}/ca_key.pem \
  -sha256 -out ${FLUENTD_CERTS_DIR}/ca_cert.pem -subj "/C=ES/ST=Seville/L=Seville/O=CloudOpting/OU=IT/CN=$FLUENTD_HOSTNAME"