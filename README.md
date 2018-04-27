# Alex Ozer's Unix Dotfiles

These are automatically pushed nightly, and manually by me on occasion with an
equally undescriptive commit message. Enjoy!

## My Setup

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

## Install

You can symlink these dotfiles to your home directory using GNU stow:

```bash
$ cd
$ git clone https://github.com/alexozer/dotfiles.git .dotfiles
$ cd .dotfiles
$ stow vim zsh bspwm # ...
```

## Screenshots

![launcher](launcher.png)
![vscode](vscode.png)
![full](full.png)
