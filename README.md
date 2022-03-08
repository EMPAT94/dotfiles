<br />
<h1 align="center"> .DOTFILES </h1>
<br />

## Intro

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage my dotfiles. A nice article on same by [stevenrbaker](https://www.stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html). Another good article by [alexpearce](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/)

## Usage

1. Clone the repository `git clone --depth=1 https://github.com/EMPAT94/dotfiles.git ~/.dotfiles`

2. Cd into the dir `cd ~/.dotfiles`

3. Dry-run on a app, eg firefox `stow --verbose --no firefox`

4. Live-run on a app, eg nvim `stow --verbose nvim`

5. Verify that symlinks were made `ls -lah ~/.config/nvim` should show `/home/<user>/.config/nvim -> ../.dotfiles/nvim/.config/nvim`

## Notes

As you can see, I use [dracula](https://draculatheme.com/) theme for most of my apps, focusing on minimalist UI with a high contrast ratio and poppy colors.

I'd recommend going through the files and cherry-picking the stuff you want to include instead of wholesale copy-paste, this means you don't get surprise changes and can tweak to your liking.

## Programs I Use

1. [terminak: kitty](https://sw.kovidgoyal.net/kitty/)
1. [shell: zsh](https://en.wikipedia.org/wiki/Z_shell)
1. [web browser 1: brave](https://brave.com/)
1. [web browser 2: firefox](https://www.mozilla.org/en-US/firefox/new/)
1. [music player: mocp](https://moc.daper.net/)
1. [text editor: neovim](https://neovim.io/)
1. [system monitor: bpytop](https://github.com/aristocratos/bpytop)
1. [password manager: bitwarden](https://bitwarden.com/)
1. [2FA app: authy](https://authy.com/)

I use this setup on a Manjaro KDE machine.

## Screenshots

- mocp:

![mocp image](./mocp.webp)

- neovim:

![nvim image](./nvim.webp)

- bpytop:

![bpytop image](./bpytop.webp)
