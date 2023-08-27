# Neovim Configuration

## Structure

```
.
├── init.lua
├── lazy-lock.json
└── lua
    └── taidaii
        ├── colorscheme.lua
        ├── keymaps.lua
        ├── lsp
        │   ├── clangd.lua
        │   └── init.lua
        ├── options.lua
        └── plugins
            ├── autopairs.lua
            ├── cmp-buffer.lua
            ├── cmp_luasnip.lua
            ├── cmp-nvim-lsp.lua
            ├── cmp-path.lua
            ├── gitsigns.lua
            ├── init.lua
            ├── luasnip.lua
            ├── nvim-cmp.lua
            ├── nvim-lspconfig.lua
            ├── nvim-tree.lua
            ├── nvim-web-devicons.lua
            ├── telescope-fzf-native.lua
            ├── telescope.lua
            ├── toggleterm.lua
            ├── tokyonight.lua
            └── treesitter.lua
```

## Plugins

[lazy.nvim](https://github.com/folke/lazy.nvim) is the plugin manager.

Every plugin has a dedicated lua file named after itself under `lua/taidaii/plugins`, except that lazy.nvim  is configured in the entry file for plugins, `lua/taidaii/plugins/init.lua`.

## LSP

Only [clangd](https://clangd.llvm.org/) is set up in the `lua/taidaii/lsp`, as I will primarily be using Neovim to develop in C++ in the foreseeable future. 

I am quite hesitant to use a LSP manager (e.g [mason.nvim](https://github.com/williamboman/mason.nvim)) as of now. Therefore, users are supposed to manually install language servers before actually configuring them with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).  

## Font

A [Nerd Font](https://www.nerdfonts.com/) is required for icons to be properly displayed in the Neovim. I am currently using [Hack](https://github.com/ryanoasis/nerd-fonts/tree/7deaff60d02ad26c38f4f8cc714300c08f598b1e/patched-fonts/Hack).