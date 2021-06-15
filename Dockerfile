FROM hashicorp/terraform:0.14.11

ENV BUILD_PACKAGES bash ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-bundler

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk --no-cache add $BUILD_PACKAGES && \
    apk --no-cache add $RUBY_PACKAGES && \
    gem install bigdecimal:3.0.2 && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/action
WORKDIR /usr/action

COPY Gemfile /usr/action/
RUN bundle install

COPY entrypoint.sh /entrypoint.sh

# Need to run as root inorder to update CA certificates
USER root

HEALTHCHECK NONE

ENTRYPOINT ["/entrypoint.sh"]
