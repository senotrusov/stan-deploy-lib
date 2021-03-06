# 🏔️ Sopka

## Sopkafile

Possible sopkafile locations are:

```sh
./sopkafile
./sopkafile/index.sh

~/.sopkafile
~/.sopkafile/index.sh
```

## API docs

* [apt](docs/lib/apt.md)
* [benchmark](docs/lib/benchmark.md)
* [bitwarden](docs/lib/bitwarden.md)
* [borg](docs/lib/borg.md)
* [config](docs/lib/config.md)
* [firefox](docs/lib/firefox.md)
* [fs](docs/lib/fs.md)
* [git](docs/lib/git.md)
* [github](docs/lib/github.md)
* [imagemagick](docs/lib/imagemagick.md)
* [linux](docs/lib/linux.md)
* [macos](docs/lib/macos.md)
* [menu](docs/lib/menu.md)
* [nodejs](docs/lib/nodejs.md)
* [postgresql](docs/lib/postgresql.md)
* [rails](docs/lib/rails.md)
* [rclone](docs/lib/rclone.md)
* [restic](docs/lib/restic.md)
* [rsync](docs/lib/rsync.md)
* [ruby](docs/lib/ruby.md)
* [shell](docs/lib/shell.md)
* [ssh](docs/lib/ssh.md)
* [sublime](docs/lib/sublime.md)
* [syncthing](docs/lib/syncthing.md)
* [systemd](docs/lib/systemd.md)
* [tailscale](docs/lib/tailscale.md)
* [tools](docs/lib/tools.md)
* [vmware](docs/lib/vmware.md)
* [vscode](docs/lib/vscode.md)

## Bitwarden keys

<!-- # bitwarden-object: see list below -->

```
"? backup passphrase"
"? backup storage"
"? github personal access token"
"? password for ssh private key"
"? ssh private key"
"? ssh public key"
```

## Environment variables

```sh
BITWARDEN_LOGIN
GIT_USER_EMAIL
GIT_USER_NAME
GITHUB_LOGIN
VERBOSE
```

# Contributing

## Please check shell scripts before commiting any changes
```sh
test/run-code-checks.sh
```

## Style guide

```sh
%q
|| fail
pipestatus
error handling in loops "for, while"
error handling in subshells () {}
error handling in complex commands like ssh "foo" or sudo "foo"
use shellcheck
```
