# github-action-kitchen-terraform
GitHub Action to run Kitchen Terraform. Release versions match the Terraform version in use.

After cloning this repo, please run:  
`make bootstrap`

This action runs [kitchen-terraform](https://github.com/newcontext-oss/kitchen-terraform) to test Terraform modules.

## Inputs

### `kitchen-command`

**Required**. the command to follow the `kitchen` entrypoint e.g. `"test"` or `"test my-scenario"`

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
        uses: dwp/github-action-kitchen-terraform@v0.14.7
        with:
          kitchen-command: "test scenario-a"
          aws-account-number: ${{ secrets.AWS_ACCOUNT }}
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.ACTIONS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.ACTIONS_SECRET_ACCESS_KEY }}
      - name: Kitchen Test B
        uses: dwp/github-action-kitchen-terraform@v0.14.7
        with:
          kitchen-command: "test scenario-b"
          aws-account-number: ${{ secrets.AWS_ACCOUNT }}
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.ACTIONS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.ACTIONS_SECRET_ACCESS_KEY }}
```

### Docker Repo

The image repository can be found [here](https://quay.io/repository/dwp/kitchen-terraform).
