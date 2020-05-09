FROM ubuntu 
#COPY helloworld.sh /
RUN         apt-get update \
                && apt-get install -y \
                    software-properties-common \
                    wget \
                && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
                && apt-get update \
                && apt-get install -y \
                    make \
                    git \
                    curl \
                    vim \
                    gcc \
                    cmake \
                    g++
COPY C-Project /
CMD ["cd C-Project; make"]

