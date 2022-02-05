# To create the image:
#   $ docker build -t steverobertson/z88dk .
# To run the container:
#   $ docker run -v ${PWD}:/src/ -it steverobertson/z88dk <command>

FROM debian:buster

ENV Z88DK_PATH="/opt/z88dk" \
    SDCC_PATH="/tmp/sdcc" \
    PATH="${Z88DK_PATH}/bin:${PATH}" \
    ZCCCFG="${Z88DK_PATH}/lib/config/"

RUN apt update && apt install -y \
        build-essential \
        git \
        subversion \
        curl \
        libxml2-dev \
        bison \
        flex \
        libboost-all-dev \
        texinfo \
        zlib1g-dev

RUN git clone --depth 1 --branch v2.1 --recursive https://github.com/z88dk/z88dk.git ${Z88DK_PATH} \
    && cd ${Z88DK_PATH} \
    && export BUILD_SDCC=1 \
    && export BUILD_SDCC_HTTP=1 \
    && ./build.sh \
    && rm -fR ${SDCC_PATH}

WORKDIR /src/
