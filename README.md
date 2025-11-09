## phpfmt Homebrew Tap

This tap provides a `phpfmt` CLI – a Zsh wrapper around `phpcbf` that enforces PSR-12 and offers convenient modes:

- default: staged + unstaged (modified & untracked) PHP files
- `-a`: all PHP files recursively under current directory
- `-p`: PHP files changed in the latest commit (HEAD)

### Install

1) Add the tap and install:

```bash
brew tap vsyaco/tap
brew install vsyaco/tap/phpfmt
```

2) Install `phpcbf` (via Composer global):

```bash
composer global require squizlabs/php_codesniffer
```

3) Ensure Composer global bin is on your PATH (add to your shell profile if needed):

```bash
export PATH="$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin:$PATH"
```

### Usage

```bash
phpfmt       # format staged + unstaged (modified & untracked) PHP files
phpfmt -a    # format all PHP files under current directory (recursively)
phpfmt -p    # format PHP files changed in the latest commit (HEAD)
```

### Development / Releasing

This formula expects the `phpfmt` script to live at the root of the `vsyaco/phpfmt` repository.

- Stable installs use a versioned tarball URL:
  - Update `url` and `sha256` in `Formula/phpfmt.rb` after tagging a release (e.g., `v1.0.0`).
  - Compute sha256:
    ```bash
    curl -L -o phpfmt-v1.0.0.tar.gz https://github.com/vsyaco/phpfmt/archive/refs/tags/v1.0.0.tar.gz
    shasum -a 256 phpfmt-v1.0.0.tar.gz
    ```
    Paste the checksum into the formula.

- HEAD installs (from main branch) for testing:
  ```bash
  brew install --HEAD vsyaco/tap/phpfmt
  ```

### Notes

- `phpfmt` auto-detects `phpcbf` in PATH and common Composer global locations.
- Defaults to PSR-12; override with env var:
  ```bash
  PHPCBF_STANDARD=PSR12 phpfmt -a
  ```


