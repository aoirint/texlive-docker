# syntax=docker/dockerfile:1.3-labs
FROM "${BASE_IMAGE:-ubuntu:20.04}"

RUN <<EOF
    set -eux
    apt-get update
    apt-get install -y \
        wget \
        tar \
        perl \
        gosu
EOF

RUN <<EOF
    set -eux
    cd /opt
    wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    tar xf install-tl-unx.tar.gz
    rm -f install-tl-unx.tar.gz
    cd install-tl-*
    perl ./install-tl --no-interaction
    cd ../
    rm -rf install-tl-*
EOF
 
