#!/bin/bash



HYPERVIP=10.211.55.2
PASSWORDKEY=lamiapassword
HOST=$(hostname)
CACHEROOT=/cache
hostTLSfolder=${CACHEROOT}/hostTLS
clientTLSfolder=${CACHEROOT}/clientTLS

mkdir -p ${hostTLSfolder}
mkdir -p ${clientTLSfolder}

cd ${hostTLSfolder}

openssl genrsa -aes256 -passout pass:${PASSWORDKEY} -out ca-key.pem 4096
openssl req -new -x509 -days 365 -key ca-key.pem  -sha256 -out ca.pem -passin pass:${PASSWORDKEY} -subj "/C=IT/ST=Veneto/L=Verona/O=osaspace/OU=learning/CN=$(hostname)/emailAddress=info@example.com"
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$(hostname)" -sha256 -new -key server-key.pem -out server.csr
echo subjectAltName = DNS:$HOST,IP:${HYPERVIP},IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf -passin pass:${PASSWORDKEY}

cd ${clientTLSfolder}
cp ${hostTLSfolder}/ca.pem ${clientTLSfolder}/
cp ${hostTLSfolder}/ca-key.pem ${clientTLSfolder}/
openssl genrsa -out key.pem 4096
openssl req -subj '/CN=client' -new -key key.pem -out client.csr
echo extendedKeyUsage = clientAuth > extfile-client.cnf
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile-client.cnf -passin pass:${PASSWORDKEY}

systemctl stop docker
cat <<EOF >/etc/docker/daemon.json
{
    "hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2376"],
    "tls": true,
    "tlscacert": "/cache/hostTLS/ca.pem",
    "tlscert": "/cache/hostTLS/server-cert.pem",
    "tlskey": "/cache/hostTLS/server-key.pem",
    "tlsverify": true
}
EOF
mkdir -p /etc/systemd/system/docker.service.d/
cat <<EOF >/etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF
systemctl daemon-reload
sleep 5
systemctl start docker
sleep 5
systemctl status docker
sleep 5
