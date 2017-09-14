# Alex Ozer's Dotfiles

This is where I share my dotfiles, with terrible commit messages that is.

Current screenshots:
![rofi](rofi.png)
![vscode](vscode.png)
![full](full.png)

I use:
- Macbook Pro Retina 2015 (MF840LL/A)
- Bspwm (window manager)
- Xfce (desktop environment minus window manager)
- Compton (transparency, shadows...)
- rofi (launcher)
- polybar (panel)
- Gnome Terminal
- zsh (shell) with oh-my-zsh
- Visual Studio Code (code editor)
- Neovim (general-purpose text editor)
- Dracula (terminal, vim, vscode, rofi, and polybar colorscheme)
- Arc Darker (gtk theme)
- Numix Circle (icon theme)
- Human (cursor theme)
- Ubuntu Mono derivative Powerline (monospace font)

You can symlink these dotfiles to your home directory using GNU stow:
```bash
$ cd
$ git clone https://github.com/alexozer/dotfiles.git .dotfiles
$ cd .dotfiles
$ stow [dir]
```
