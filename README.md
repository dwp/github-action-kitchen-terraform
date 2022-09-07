# github-action-kitchen-terraform

GitHub Action to run Kitchen Terraform.

After cloning this repo, please run:  
`make bootstrap`

This action runs [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform) to test Terraform modules.

## Inputs

### `kitchen-command`

**Required**. the command to follow the `kitchen` entrypoint e.g. `"test"` or `"test my-scenario"`

### `aws-account-number`

**Required**. AWS account number, used to redact from kitchen/terraform output

### `terraform-version`

**Required**. Terraform version to use. Supported versions (tags) listed [here](https://github.com/dwp/github-action-kitchen-terraform/pkgs/container/github-action-kitchen-terraform)

## Example usage

```yml
on: [pull_request]
jobs:
  test:
    name: test
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v2
      - name: Kitchen Test A
        uses: dwp/github-action-kitchen-terraform@v2.0.0
        with:
          terraform-version: "1.2.5"
          kitchen-command: "test scenario-a"
          aws-account-number: ${{ secrets.AWS_ACCOUNT }}
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.ACTIONS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.ACTIONS_SECRET_ACCESS_KEY }}
          GITLAB_USER: ${{ secrets.GITLAB_USER }}
          GITLAB_PAT: ${{ secrets.GITLAB_PAT }}
      - name: Kitchen Test B
        uses: dwp/github-action-kitchen-terraform@v0.14.7
        with:
          terraform-version: "1.2.5"
          kitchen-command: "test scenario-b"
          aws-account-number: ${{ secrets.AWS_ACCOUNT }}
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.ACTIONS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.ACTIONS_SECRET_ACCESS_KEY }}
          GITLAB_USER: ${{ secrets.GITLAB_USER }}
          GITLAB_PAT: ${{ secrets.GITLAB_PAT }}
```

### Docker Repo

The image repository can be found on:

* [Docker Hub](https://hub.docker.com/repository/docker/dwpdigital/kitchen-terraform)
* [GitHub container registry](https://github.com/dwp/github-action-kitchen-terraform/pkgs/container/github-action-kitchen-terraform)
* [Quay.io](https://quay.io/repository/dwp/kitchen-terraform)

Use the Docker image to run an equivalent locally using the example commands below:

Standard Kitchen command

```shell
docker run --rm -e AWS_PROFILE=default -v $(pwd):/usr/action -v ~/.aws:/root/.aws quay.io/dwp/kitchen-terraform:1.2.5 "test scenario-a"
```

Kitchen command with GitLab user and GitLab Personal Access Token.
Used when Terraform contains references to external modules that require Git credentials.

```shell
docker run --rm -e AWS_PROFILE=default -e GITLAB_USER=user.name -e GITLAB_PAT=token -v $(pwd):/usr/action -v ~/.aws:/root/.aws quay.io/dwp/kitchen-terraform:1.2.5 "test scenario-a"
```

Kitchen command with redacted output - output is piped to `sed` and the second argument is used to find/replace, this can be a string or regex

```shell
docker run --rm -e AWS_PROFILE=default -v $(pwd):/usr/action -v ~/.aws:/root/.aws quay.io/dwp/kitchen-terraform:1.2.5 "test scenario-a" "0123456789"
```

Kitchen command with custom certificate trusts - mounts a local directory of certificates to trust

```shell
docker run --rm -u root -e AWS_PROFILE=default -e CUSTOM_CA_DIR=/usr/share/ca-certificates/custom -v /etc/ssl/certs/:/usr/share/ca-certificates/custom -v $(pwd):/usr/action -v ~/.aws:/root/.aws quay.io/dwp/kitchen-terraform:1.2.5 "test scenario-a"
```
