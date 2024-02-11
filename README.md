# Dotfiles

Various dotfiles for my Linux environment.

![screenshot](./screenshot.png)

## Stow

Dotfiles are managed by [GNU Stow](https://www.gnu.org/software/stow/).

## Usage

1. Clone directory into `~/.dotfiles`
2. Use `stow *` to manage symlinks between `~/.dotfiles` and `~/.config`
3. Or if you only care about specific dotfiles: `stow <dir_name>`
