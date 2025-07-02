# Dotfiles Repository

My personal configuration files for i3, Neovim, and Rofi, managed with GNU Stow.

## Repository Structure
```
dotfiles/
├── .gitignore
├── i3/
│ └── .config/
│   └── i3/
│     ├── config
│     ├── i3lock.sh
│     ├── i3status.conf
│     └── picom.conf
├── nvim/
│ └── .config/
│   └── nvim/
│     ├── init.lua
│     ├── lua/ # Lua modules
│     └── ... # Other Neovim files
├── rofi/
| └── .config/
│   └── rofi/
│     └── config.rasi
├── kanata/
| ├── .config/
│ │ └── kanata/
│ │   └── kanata.kbd
| ├── .kanata/
│ │ └── kanata
```

## Installation

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```
2. Use GNU Stow to symlink the configurations:
   ```bash
   stow i3
   stow nvim
   stow rofi
   ```
3. Dependencies
    - i3: i3-wm, i3status, picom, i3lock
    - Neovim (>= 0.10)
    - Rofi
  
## Management
To add new configurations:
- Create the appropriate folder structure under ~/dotfiles
- Place your config files in the correct location
- Run stow to create symlinks

Example:
  ```bash
  mkdir nvim
  mkdir nvim/.config
  mv -r ~/.config/nvim ~/dotfiles/nvim/.config
  stow nvim
  ```
## Kanata groups setup
To allow for non-sudo running of kanata:
  ```bash
  sudo groupadd uinput
  sudo usermod -aG input $USER
  sudo usermod -aG uinput $USER
  stow nvim
  ```
Add the following text to /etc/udev/rules.d/kanata.rules:
    ```bash
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    ```
Reboot to apply changes.
