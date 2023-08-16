ARG RUBY_VERSION=3.1.2
FROM ruby:${RUBY_VERSION}

ARG TERRAFORM_VERSIONS=latest

RUN groupadd -g 1001 kitchen \
  && useradd -ms /bin/bash kitchen -u 1001 -g 1001 \
  && mkdir -p /usr/kitchen \
  && chown kitchen:kitchen /usr/kitchen \
  && chmod 750 /usr/kitchen \
  && apt-get update \
  && apt-get --no-install-recommends -y install ca-certificates jq \
  && update-ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Install tfenv
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git /opt/.tfenv \
  && ln -s /opt/.tfenv/bin/* /bin \
  && for version in ${TERRAFORM_VERSIONS}; do tfenv install ${version}; done \
  && chown -R kitchen:kitchen /opt/.tfenv/

USER kitchen
WORKDIR /usr/kitchen
COPY entrypoint.sh /entrypoint.sh
COPY --chown=kitchen:kitchen Gemfile Gemfile.lock /usr/kitchen/
RUN bundle && bundle binstubs --all

WORKDIR /usr/action

# KICS expects a healthcheck defined
HEALTHCHECK NONE
ENTRYPOINT ["/entrypoint.sh"]
