FROM ubuntu 
#COPY helloworld.sh /
RUN apt install gcc make build-utils -y /
COPY C-Project /
CMD ["cd C-Project; make"]

