FROM hashicorp/terraform:0.14.7

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

RUN addgroup -S action && adduser -S action -G action
USER action

HEALTHCHECK NONE

ENTRYPOINT ["/entrypoint.sh"]
