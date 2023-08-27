-- Use lazy.nvim as the plugin manager :)

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  error("Failed to load lazy.nvim")
  return
end

-- Configure lazy.nvim
local lazy_opt = {
  ui = {
    size = { width = 0.7, height = 0.6 },
    border = "rounded",
  },
}

-- List all the plugins here
local plugins = {

  -- colorscheme
  require("taidaii.plugins.tokyonight"),

  -- completion
  require("taidaii.plugins.nvim-cmp"),
  require("taidaii.plugins.cmp-buffer"),
  require("taidaii.plugins.cmp-path"),
  require("taidaii.plugins.cmp-nvim-lsp"),
  require("taidaii.plugins.luasnip"),
  require("taidaii.plugins.cmp_luasnip"),

  -- lsp
  require("taidaii.plugins.nvim-lspconfig"),

  -- telescope
  require("taidaii.plugins.telescope"),
  require("taidaii.plugins.telescope-fzf-native"),

  -- treesitter
  require("taidaii.plugins.treesitter"),

  -- autopairs
  require("taidaii.plugins.autopairs"),

  -- gitsigns
  require("taidaii.plugins.gitsigns"),

  -- nvim-tree
  require("taidaii.plugins.nvim-tree"),
  require("taidaii.plugins.nvim-web-devicons"),

  -- toggleterm
  require("taidaii.plugins.toggleterm"),

}


lazy.setup(plugins, lazy_opt)
