<br />
<h1 align="center"> .DOTFILES </h1>
<br />

## Intro

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage my dotfiles.

A nice article on same by [stevenrbaker](https://www.stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html)

Another good article by [alexpearce](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/)

## Usage

1. Clone the repository `git clone --depth=1 https://github.com/EMPAT94/dotfiles.git ~/.dotfiles`

2. Cd into the dir `cd ~/.dotfiles`

3. Dry-run on a app, eg firefox `stow --verbose --no firefox`

4. Live-run on a app, eg nvim `stow --verbose nvim`

5. Verify that symlinks were made `ls -lah ~/.config/nvim`
should show `/home/<user>/.config/nvim -> ../.dotfiles/nvim/.config/nvim`

## TODO

- [ ] Screenshots
- [ ] Details about what's what
- [ ] ToC
