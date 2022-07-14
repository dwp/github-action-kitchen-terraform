ARG TERRAFORM_VERSION=0.14.7
ARG RUBY_VERSION=3.1.2

FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform

FROM ruby:${RUBY_VERSION}
WORKDIR /usr/action
RUN useradd -ms /bin/bash kitchen \
  && chown kitchen:kitchen /usr/action
USER kitchen
COPY entrypoint.sh /entrypoint.sh
COPY --from=terraform /bin/terraform /bin/terraform
COPY --chown=kitchen:kitchen Gemfile Gemfile.lock /usr/action/
RUN bundle install

# KICS
HEALTHCHECK NONE
ENTRYPOINT ["/entrypoint.sh"]
