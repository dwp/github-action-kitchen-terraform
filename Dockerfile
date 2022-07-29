# Testing PR flow, not merging this PR
ARG TERRAFORM_VERSION=0.14.7
ARG RUBY_VERSION=3.1.2

FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform

FROM ruby:${RUBY_VERSION}
RUN groupadd -g 1001 kitchen \
  && useradd -ms /bin/bash kitchen -u 1001 -g 1001 \
  && mkdir -p /usr/kitchen \
  && chown kitchen:kitchen /usr/kitchen \
  && chmod 750 /usr/kitchen \
  && apt-get update \
  && apt-get --no-install-recommends -y install ca-certificates \
  && update-ca-certificates \
  && rm -rf /var/lib/apt/lists/*

USER kitchen
WORKDIR /usr/kitchen
COPY entrypoint.sh /entrypoint.sh
COPY --from=terraform /bin/terraform /bin/terraform
COPY --chown=kitchen:kitchen Gemfile Gemfile.lock /usr/kitchen/
RUN bundle && bundle binstubs --all

WORKDIR /usr/action

# KICS
HEALTHCHECK NONE
ENTRYPOINT ["/entrypoint.sh"]
