# homebrew-rysh

Homebrew tap for Rysh — agentic terminal multiplexer. It carries **two
builds, as two separate formulae**:

| Formula | Build | Command | Install |
| --- | --- | --- | --- |
| `rysh` | open-source build (Apache-2.0, [rysh-cli-code](https://github.com/rysh-ai/rysh-cli-code)) | `rysh` | `brew install rysh-ai/rysh/rysh` |
| `ry` | rysh.ai private build | `ry` | `brew install rysh-ai/rysh/ry` |

They are independent packages and can be installed side by side.

## If you installed `rysh` before 2026-07-27

Until 2026-07-27 the `rysh` formula served the private build (≤ 0.1.30).
From 2026-08-01 this tap mapped `rysh` -> `ry`, and `brew update` migrated
those installs to `ry` automatically. That rename has been withdrawn: `rysh`
now means the open-source build.

- **Already migrated** (`ry --version` works): nothing to do; `brew upgrade`
  keeps you on `ry`.
- **Not migrated** (you still have a `rysh` 0.1.x and have not run
  `brew update` since August): your next `brew upgrade` moves you to the
  **open-source** `rysh`. To stay on the private build instead:

  ```sh
  brew uninstall rysh
  brew install rysh-ai/rysh/ry
  ```

## Installing the open-source `rysh` after a migration

The 2026-08 migration left two symlinks named `rysh` that point at `ry`
(`Cellar/rysh` and `opt/rysh`). Remove them before installing the
open-source formula:

```sh
rm "$(brew --cellar)/rysh" "$(brew --prefix)/opt/rysh"
brew install rysh-ai/rysh/rysh
```
