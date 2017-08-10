# Alex Ozer's Dotfiles

This is where I share my dotfiles, with terrible commit messages that is.

Current screenshots:
![empty](empty.png)
![notbusy](notbudy.png)
![code](code.png)

I use:
- Macbook Pro Retina 2015 (MF840LL/A)
- Xfce (desktop environment minus window manager)
- Bspwm (window manager)
- Compton (transparency, shadows...)
- Numix Circle (icon theme)
- Arc Darker (gtk theme)
- Human (cursor theme)
- Whiskermenu (launcher)
- Gnome Terminal
- zsh (shell) with oh-my-zsh
- Visual Studio Code (code editor)
- Neovim (general-purpose text editor)
- Dracula (terminal + editor colorscheme)

You can symlink these dotfiles to your home directory using GNU stow:
```bash
$ cd
$ git clone https://github.com/alexozer/dotfiles.git .dotfiles
$ cd .dotfiles
$ stow [dir]
```
