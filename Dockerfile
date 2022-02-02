# To create the image:
#   $ docker build -t steverobertson/z88dk .
# To run the container:
#   $ docker run -v ${PWD}:/src/ -it steverobertson/z88dk <command>

FROM debian:buster

RUN apt update && apt install -y \
        build-essential \
        git \
        subversion \
        libxml2-dev \
        bison \
        flex \
        libboost-all-dev \
        texinfo

ENV Z88DK_PATH="/opt/z88dk" \
    SDCC_PATH="/tmp/sdcc"

RUN git clone --depth 1 --branch v1.99c --recursive https://github.com/z88dk/z88dk.git ${Z88DK_PATH}

RUN cd ${Z88DK_PATH} \
    && ./build.sh \
    && rm -fR ${SDCC_PATH}

ENV PATH="${Z88DK_PATH}/bin:${PATH}" \
    ZCCCFG="${Z88DK_PATH}/lib/config/"

WORKDIR /src/
