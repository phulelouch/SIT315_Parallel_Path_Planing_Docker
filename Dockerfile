FROM debian:buster AS builder

RUN set -ex;                                                                      \
    apt-get update;                                                               \
    apt-get install -y g++ curl cmake libzmq3-dev git libssl-dev zlib1g-dev;      \
    mkdir -p /usr/src;                                                            \
    cd /usr/src;                                                                  \
    curl -L https://github.com/zeromq/cppzmq/archive/v4.6.0.tar.gz | tar -zxf -;  \
    cd /usr/src/cppzmq-4.6.0;                                                     \
    cmake -D CPPZMQ_BUILD_TESTS:BOOL=OFF .; make; make install

RUN mkdir /home/project/;

RUN apt-get install libuv1-dev; \
    git clone https://github.com/uWebSockets/uWebSockets; \
    cd uWebSockets; \
    git checkout e94b6e1; \
    mkdir build; \
    cd build; \
    cmake ..; \
    make; \
    make install; \
    cd ..; \
    cd ..; \
    ln -s /usr/lib64/libuWS.so /usr/lib/libuWS.so;

COPY . /home/project/

RUN set -ex;              \
    cd /home/project/; rm -r build; mkdir build && cd build && cmake .. && make;# && ./path_planning;


