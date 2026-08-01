# homebrew-rysh

Homebrew tap for Rysh — agentic terminal multiplexer.

## Install

```sh
brew install rysh-ai/rysh/ry
```

## The formula was renamed: `rysh` → `ry`

The formula (and the installed command) is now **`ry`**. The old `rysh`
formula stopped receiving updates at 0.1.28 and has been retired.

If you installed with the old name, upgrade as usual:

```sh
brew update
brew upgrade rysh
```

Homebrew resolves the rename automatically, migrates your installed keg,
and installs the current `ry` release. Afterwards the command is `ry`,
not `rysh`:

```sh
ry --version
```
