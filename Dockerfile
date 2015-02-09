FROM ruby:onbuild
MAINTAINER Sandro Padin <s@ndropad.in>

EXPOSE 8080

ENV ENV production

CMD ["bin/start"]
