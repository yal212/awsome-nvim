# awesome-nvim

My personal Neovim configuration using lazy.nvim for plugin management.

Requirements
- Neovim 0.8+ (0.9+ recommended)
- Git
- Optional but recommended: ripgrep (rg), fd, a C/C++ toolchain for building native plugins

Installation

Clone this repository into your Neovim config directory:

```bash
# backup existing config if needed
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# clone repo
git clone https://github.com/yal212/awsome-nvim.git ~/.config/nvim