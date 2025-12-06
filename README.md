# awsome-nvim

My personal Neovim configuration using lazy.nvim for plugin management.

Requirements
- Neovim 0.8+ (0.9 recommended)
- Git

Installation

Clone this repository into your Neovim config directory:

```bash
# backup existing config if needed
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# clone repo
git clone https://github.com/<your-username>/awsome-nvim.git ~/.config/nvim
```

Start Neovim; `lazy.nvim` is bootstrapped in `init.lua`. To install or update plugins run inside Neovim:

:Lazy sync

Repository layout
- `init.lua` — entrypoint (bootstraps lazy.nvim)
- `lua/` — Lua modules and plugin configs

Contributing
Feel free to open issues or PRs. Keep changes small and documented.
