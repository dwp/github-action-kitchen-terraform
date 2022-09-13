# Changelog

## [2.0.0](https://github.com/dwp/github-action-kitchen-terraform/compare/v1.0.0...v2.0.0) (2022-09-13)


### ⚠ BREAKING CHANGES

* use tfenv to manage Terraform versions
* set Terraform version using Action input (#29)

### Features

* add workflow to generate releases ([3bc4be2](https://github.com/dwp/github-action-kitchen-terraform/commit/3bc4be2debc07068b783379ca7eb15c7019642f2))
* publish containers to GitHub container registry ([efb0199](https://github.com/dwp/github-action-kitchen-terraform/commit/efb0199ab445d1d6e443d9896b4e22c75c932858))
* set Terraform version using Action input ([#29](https://github.com/dwp/github-action-kitchen-terraform/issues/29)) ([e916d29](https://github.com/dwp/github-action-kitchen-terraform/commit/e916d2973301924f29d8a805a42661c2cbe5dadd))
* use tfenv to manage Terraform versions ([6763f54](https://github.com/dwp/github-action-kitchen-terraform/commit/6763f546d564c4cac6420974b779033594e86b59))


### Bug Fixes

* use hardcoded container registry URI ([1507d85](https://github.com/dwp/github-action-kitchen-terraform/commit/1507d859d46bee151cbf64d0e0151be589af820f))

## 1.0.0 (2022-09-05)


### Features

* allow trusting additional certificates at run time ([ad3329e](https://github.com/dwp/github-action-kitchen-terraform/commit/ad3329e533d17de8cd91dec032d8b21f9840acce))


### Bug Fixes

* fix "command not found" error when passing an action and suite ([cc359c4](https://github.com/dwp/github-action-kitchen-terraform/commit/cc359c4a1b1e5096f642794870045f12480e80b7))

## 0.14.7

💥 Breaking changes:

🆕 New features:

- Initial release

  Action created
  Docker image published to Quay.io
  Support redacting output (e.g. AWS account number)
  Support custom certificate trusts in Docker image (for local use)

  ([PR #5](https://github.com/dwp/terraform-github-repository/pull/5))

🔧 Fixes:
