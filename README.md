# 🛠️ dotfiles

Welcome to my **dotfiles** repository — a centralized collection of my personal configurations for shells, editors, terminal emulators, and various CLI tools that I use on a daily basis in Unix-like environments.

The main goal of this repository is to maintain a consistent, portable, and version-controlled setup. The configuration files are organized to be easily managed and installed using [GNU Stow](https://www.gnu.org/software/stow/), following a modular and declarative structure.

### 📦 Structure & Usage

Each directory in this repository corresponds to a specific application or tool, with configuration files laid out to mirror the structure of the home directory. Using `stow`, symbolic links are created seamlessly, preserving organization and keeping configurations isolated per tool.

> Example usage (from the repository root):
>
> ```bash
> stow nvim
> stow zsh
> ```

### 🧩 Included Tools & Configurations

This repository contains my configuration files for the following tools:

- **Shells & Prompt**
  - `zsh` + `starship`
- **Terminal Emulators & Multiplexer**
  - `kitty`
  - `foot`
  - `tmux`
- **Editors & CLI Tools**
  - `neovim` (with LazyVim)
  - `doom emacs`
  - `git`
  - `lazygit`
- **X11 Environment**
  - `rofi` (launcher)
  - `polybar` (status bar)
  - `dunst` (notification daemon)
  - `i3` (window manager)
  - `picom` (X11 compositor)
- **Wayland Environment**
  - `fuzzel` (launcher)
  - `waybar` (status bar)
  - `dunst` (notification daemon)
  - `sway` (window manager)
- **Utilities**
  - `fastfetch`
  - `zoxide`
  - `mpv`
  - `yt-dlp`
  - `flameshot`
  - `newsboat`

---

Feel free to explore, reuse, or adapt any part of this setup.  
Issues and pull requests are welcome!
