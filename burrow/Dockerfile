FROM golang:1.9.2
MAINTAINER gom "gomgom68@gmail.com"

RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/linkedin/Burrow
RUN cd /go/src/github.com/linkedin/Burrow \
        && dep ensure \
        && go install

RUN mkdir /etc/burrow/
#ADD burrow.toml /etc/burrow/

CMD ["/go/bin/Burrow", "--config-dir", "/etc/burrow"]
