ARG TERRAFORM_VERSION=0.14.7
ARG RUBY_VERSION=3.1.2

FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform

FROM ruby:${RUBY_VERSION}
RUN useradd -ms /bin/bash kitchen \
  && chown kitchen:kitchen /usr/kitchen \
  && apt install ca-certificates \
  && update-ca-certificates

USER kitchen
COPY entrypoint.sh /entrypoint.sh
COPY --from=terraform /bin/terraform /bin/terraform
COPY --chown=kitchen:kitchen Gemfile Gemfile.lock /usr/kitchen/
RUN bundle config --system \
  && bundle install --binstubs

WORKDIR /usr/action

# KICS
HEALTHCHECK NONE
ENTRYPOINT ["/entrypoint.sh"]
