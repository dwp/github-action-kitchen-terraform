# Changelog

## [2.3.0](https://github.com/dwp/github-action-kitchen-terraform/compare/v2.2.0...v2.3.0) (2024-06-21)


### Features

* update release-please version to latest ([#46](https://github.com/dwp/github-action-kitchen-terraform/issues/46)) ([0c3c712](https://github.com/dwp/github-action-kitchen-terraform/commit/0c3c712d9f21df74e38af45dabb7d56b739d623b))

## [2.2.0](https://github.com/dwp/github-action-kitchen-terraform/compare/v2.1.0...v2.2.0) (2024-06-19)


### Features

* **gemfile:** update kitchen terraform to use v7 ([#44](https://github.com/dwp/github-action-kitchen-terraform/issues/44)) ([42b75c6](https://github.com/dwp/github-action-kitchen-terraform/commit/42b75c6665ec2f154f9581d40e8d9b95630e5619))


### Bug Fixes

* update terraform version for container ([#40](https://github.com/dwp/github-action-kitchen-terraform/issues/40)) ([1d30681](https://github.com/dwp/github-action-kitchen-terraform/commit/1d3068146c2e9bb0e7b9a101af926e6b4f46e6f6))

## [2.1.0](https://github.com/dwp/github-action-kitchen-terraform/compare/v2.0.1...v2.1.0) (2023-08-16)


### Features

* add `jq` to Docker image ([541712f](https://github.com/dwp/github-action-kitchen-terraform/commit/541712fe503880fd17fd8048418a12b61965c1ed))

## [2.0.1](https://github.com/dwp/github-action-kitchen-terraform/compare/v2.0.0...v2.0.1) (2022-09-27)


### Bug Fixes

* build containers on release ([dcecb75](https://github.com/dwp/github-action-kitchen-terraform/commit/dcecb7542a7fb1215b9982aadd03b4e026c93624))

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
