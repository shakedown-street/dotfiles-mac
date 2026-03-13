# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/)

#### Install stow

Homebrew:

```bash
brew install stow
```

#### Usage

Clone the repo into your home directory and run stow to install symlinks:

```bash
stow --no-folding ghostty helix yazi zellij zsh
```

*Note* The `--no-folding` flag ensures that only the files are symlinked and not full directories.

To remove a packages symlinks:

```bash
stow -D zsh
```

Since files are symlinked, you can edit files in the repo and they'll be automatically applied.  To update just run `git pull`.

For some files that are likely to have machine-specific changes such as `.zshrc` it may be a good idea to just copy them manually instead of managing them with stow.
However, that'll mean that you'll lose the ability to update them with `git pull` and changes must be manually synced to/from the repo.
