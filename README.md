# 🪟 Windows‑Specific Dotfiles

This branch (`windows`) contains only the configuration files and tools I use on **Windows systems**.  
It is separated from the main branch to avoid mixing Linux/macOS configurations with those required only for Windows or WSL.

---

## 📦 Included Configurations

This branch includes:

- PowerShell and PowerShell Core profile settings (`Microsoft.PowerShell_profile.ps1`)
- Windows Terminal settings (`settings.json`)
- Neovim configuration (used via WSL or native Windows installation)
- `starship.toml` prompt configuration
- `zsh/` folder for WSL Zsh integration (if used)
- Windows-specific `.gitconfig` overrides
- Helper scripts (e.g., `.ps1`, `.bat`, or `.sh` under WSL)
- Optional tools: `fzf`, `bat`, `zoxide`, `ripgrep`, `fd` (via WSL or Windows-native)

---

## 🚀 Quick Setup

> ⚠️ This assumes [Git](https://git-scm.com), [PowerShell 7+](https://learn.microsoft.com/powershell/scripting/install/installing-powershell), and optionally [Windows Terminal](https://aka.ms/terminal) are installed.

Clone and install:

```powershell
git clone https://github.com/fscotto/dotfiles -b windows $HOME\.dotfiles
cd $HOME\.dotfiles
.\bootstrap_windows.ps1
````

The script will:

* Copy or symlink PowerShell profile(s)
* Configure Windows Terminal settings
* Place `starship.toml` in the correct location
* Configure Neovim under `$env:LOCALAPPDATA\nvim` or WSL
* Set up additional tools if available

---

## 🧰 Optional Tools

Install these tools to get the best experience:

| Tool       | Installation (native)          | Usage                      |
| ---------- | ------------------------------ | -------------------------- |
| `starship` | `winget install starship`      | Prompt in PowerShell/Zsh   |
| `zoxide`   | `winget install zoxide`        | Smarter `cd`               |
| `bat`      | `winget install bat`           | Better `cat`               |
| `fzf`      | `winget install fzf`           | Fuzzy file finder          |
| `fd`       | `winget install fd`            | Fast file search           |
| `ripgrep`  | `winget install ripgrep`       | Recursive grep alternative |
| `neovim`   | `winget install Neovim.Neovim` | Editor (native or WSL)     |

> You can also install these inside WSL with `apt` or `xbps-install`, depending on the distro.

---

## 🧪 Neovim in WSL or Windows

This setup supports both native Neovim (in `AppData\Local\nvim`) and WSL Neovim (`~/.config/nvim`):

* Use the same config by syncing with `stow`, `rclone`, or a symbolic link
* Make sure `nvim` is in your `$PATH` (native or via WSL)
* Optional plugin managers: lazy.nvim, vim-plug, etc.

---

## ⚙️ Git Configuration

This branch includes Windows-specific Git settings (e.g. line endings, credential manager):

```bash
# .gitconfig.windows
[core]
  autocrlf = true
[credential]
  helper = manager-core
```

You can include this in your global config with:

```bash
git config --global include.path ~/.dotfiles/.gitconfig.windows
```

---

## 🖥️ Windows Terminal Settings

Settings are stored at:

```text
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

> You can symlink or manually copy from this repo if needed.

---

## 🧭 Branch Structure

| Branch    | Purpose                          | Content                                   |
| --------- | -------------------------------- | ----------------------------------------- |
| `master`  | Main configuration (Linux/macOS) | Shell, Neovim, Tmux, tools, etc.          |
| `windows` | Windows-only configuration       | PowerShell, Windows Terminal, WSL support |

---

## 📂 Directory Structure

```text
dotfiles/
├── powershell/                # PowerShell profiles
├── windows-terminal/          # Windows Terminal settings
├── nvim/                      # Neovim config (optional WSL sync)
├── starship.toml              # Prompt config
├── bootstrap_windows.ps1      # Setup script
└── .gitconfig.windows         # Git config overrides
```

---

## 🤝 Contributing

Found a useful Windows-only configuration or script?
Feel free to fork and open a pull request against the `windows` branch.

---

## 📝 License

MIT — Feel free to use, modify, and adapt.

---

> Maintained by [fscotto](https://github.com/fscotto)
> For Windows configuration only. See the `master` branch for full cross-platform support.
