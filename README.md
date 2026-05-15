                          AI SLOP WARNING


# Custom Dotfiles & System Setup

Welcome to my personal dotfiles repository! This repository contains the configurations I use to rice my Ubuntu system and make my terminal workflow more efficient and beautiful.

## What's Included

Here is a quick overview of the tools and configurations contained in this repository:

### 1. Terminal Emulator: Kitty (`kitty/`)
- Uses **Kitty** terminal for its speed, GPU acceleration, and excellent support for ligatures and images.
- Configured with a clean, borderless UI, background opacity (`0.92`), and blur.
- Custom keybindings for managing tabs and window splits seamlessly.
- Theming support set up (currently supporting Catppuccin and Gruvbox themes via includes).

### 2. Shell & Prompt: Bash + Starship (`bashrc` & `starship.toml`)
- **Bash Shell**: The default `~/.bashrc` has been heavily customized:
  - Uses `fastfetch` to display a beautiful summary of system hardware and software on every new session. If `fastfetch` is not installed, it gracefully falls back to a minimal dynamic status line showing the current `$USER` and `$HOSTNAME`.
  - Quality-of-life aliases for `ls` to enforce colors by default.
  - Quick navigation shortcuts (`..`, `...`).
  - Git command abbreviations (`gs`, `gc`, `gp`, `gl`).
- **Starship Prompt**: A blazingly fast, cross-shell prompt written in Rust.
  - Configured with a modern, block-style aesthetic using Nerd Font icons.
  - Soft pastel color palette (lavender, soft blue, gold).
  - Clean Git branch and status indicators.
  - Optimized for speed by disabling heavy modules like AWS, Docker, and GCP.

### 3. Desktop Environment: GNOME Extensions
- The desktop environment is customized using **GNOME Extensions** to achieve a heavily riced, premium appearance.
- **Extension Manager** is used to install and configure these community mods.
- **Key Extensions Used (or planned):**
  - **Vitals:** Hardware monitoring (CPU, RAM, Temps) embedded in the top bar.
  - **Blur my Shell:** Adds a frosted glass aesthetic to the UI.
  - **Space Bar:** Converts the 'Activities' button into minimal workspace indicators.
  - **Just Perfection:** Tweaks and hides unwanted UI elements for a clean, minimal look.

## Getting Started

To replicate this exact setup on your own machine, please refer to the [guide.txt](guide.txt) file included in this repository. It contains step-by-step instructions on prerequisites to install (like Nerd Fonts, Kitty, and Starship) and how to safely symlink these configuration files into your home directory.

## Future Plans (Ricing)

Things I am looking into for future expansion:
- **System-Wide Theming:** Applying GTK and Shell themes (like Catppuccin) to match the terminal.
- **Modern CLI Replacements:** Integrating tools like `eza` (for `ls`), `bat` (for `cat`), and `zoxide` (for `cd`).
- **Terminal Multiplexing:** Adding configurations for `zellij` or `tmux`.
