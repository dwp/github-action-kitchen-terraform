# Contributing

## Contents of this file

### For contributors

- [Running locally](#running-locally)
- [Conventions to follow](#conventions-to-follow)
- [Testing and linting](#testing-and-linting)
- [Updating Changelog](#updating-changelog)


### For maintainers

- [Releasing a new version](#releasing-a-new-version)


## Running locally

The Action functionality is built into a Docker container. The container can be built locally or pulled from Quay.io. See [README.md](README.md)  for further examples.


## Conventions to follow
Follow [GitHub Actions Guidelines](https://docs.github.com/en/actions/creating-actions).


## Testing and linting

None currently.


## Updating Changelog

If you open a GitHub pull request on this repo, please update `CHANGELOG` to reflect your contribution.

Add your entry under `Unreleased` as `Breaking changes`, `New features`, `Fixes`.

Internal changes to the project that are not part of the public Action do not need changelog entries, for example, this file.

See the [`CHANGELOG_TEMPLATE.md`](CHANGELOG_TEMPLATE.md) for an example for how this looks.


## Releasing a new version

Currently, release version numbers match the Terraform version in use. This is to make it simpler to pick the version that matches the Terraform code being tested. Release are created manually, which could mean editing an existing release.
