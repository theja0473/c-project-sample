FROM alpine
#COPY helloworld.sh /
RUN apk add build-base /
COPY C-Project /
CMD ["cd C-Project; make"]

