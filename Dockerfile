FROM hashicorp/terraform:0.14.7

ENV BUILD_PACKAGES bash ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-bundler

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    gem install bigdecimal && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/action
WORKDIR /usr/action

COPY Gemfile /usr/action/
RUN bundle install

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
