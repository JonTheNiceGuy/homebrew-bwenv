# homebrew-bwenv

Homebrew tap for [bwenv](https://github.com/JonTheNiceGuy/bwenv): run commands with secrets resolved from
`op://` and `bw://` references in your Bitwarden or Vaultwarden vault.

## Install

```bash
brew install JonTheNiceGuy/bwenv/bwenv
```

This also installs the Bitwarden CLI (`bitwarden-cli`). Log in once with `bw login`, then see the
[bwenv README](https://github.com/JonTheNiceGuy/bwenv#usage) for usage.

## Upgrade

```bash
brew update && brew upgrade bwenv
```

## How this tap is maintained

`Formula/bwenv.rb` is updated automatically: when a version of bwenv is tagged, its release workflow
publishes the release and then pushes the new version and checksum here. The formula is installed,
tested and audited on macOS and Linux on every change.
