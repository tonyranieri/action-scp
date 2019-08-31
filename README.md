# SCP Github Action

This action allows you to SCP files to a given server.

Only key-based authentication is supported, key must not have a passphrase.

## Usage

Basic:

```yaml
name: 'Sample action'
on:
  push:
    branches:
      - master
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@master
    - uses: tonyranieri/action-scp@master
      with:
        key: ${{ secrets.SSH_DEPLOY_KEY }}
        user: ${{ secrets.SSH_DEPLOY_USER }}
        hostname: ${{ secrets.SSH_IP }}
        source: src/sample-file.txt
        destination: "~/sample-destination/"
```

## License

This project is released under the [MIT License](LICENSE)

Hat tip to <https://github.com/appleboy/scp-action>.
