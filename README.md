# Unix Dotfiles

> Alex Ozer

This is where I share my dotfiles, with terrible commit messages that is.

Current screenshots:
![launcher](launcher.png)
![vscode](vscode.png)
![full](full.png)

I use:
- Macbook Pro Retina 2015 (MF840LL/A)
- Arch Linux
- Bspwm (window manager)
- Xfce (desktop environment minus window manager)
- Compton (compositor, used for transparent borders and panel)
- Whiskermenu (launcher)
- Polybar (panel)
- Gnome Terminal
- Zsh (shell)
- Antigen (zsh plugin mananger)
- Visual Studio Code (code editor)
- Neovim (general-purpose text editor)
- Rofi (general-purpose menu) with Clipmenu (clipboard history manager)
- Dracula (terminal, Vim, VSCode, Polybar, and Rofi colorscheme)
- Arc Darker (GTK theme)
- Papirus (icon theme)
- Human (cursor theme)
- Ubuntu Mono derivative Powerline (terminal font)
- Fira Code (VSCode font)

You can symlink these dotfiles to your home directory using GNU stow:
```bash
$ cd
$ git clone https://github.com/alexozer/dotfiles.git .dotfiles
$ cd .dotfiles
$ stow vim zsh bspwm # ...
```
