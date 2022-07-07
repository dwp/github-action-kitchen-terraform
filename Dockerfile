ARG TERRAFORM_VERSION=0.14.7
ARG RUBY_VERSION=3.0.0

FROM hashicorp/terraform:${TERRAFORM_VERSION} as terraform

FROM ruby:${RUBY_VERSION}
WORKDIR /usr/action

COPY entrypoint.sh /entrypoint.sh
COPY --from=terraform /bin/terraform /bin/terraform
COPY Gemfile Gemfile.lock /usr/action/
RUN bundle install
ENTRYPOINT ["/entrypoint.sh"]
