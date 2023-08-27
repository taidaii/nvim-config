local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  error("Failed to load lspconfig!")
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  error("Failed to load cmp_nvim_lsp!")
  return
end

local lsp_defaults = lspconfig.util.default_config

-- capabilities
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  cmp_nvim_lsp.default_capabilities()
)

-- keymaps for lsp
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap({'n', 'v'}, '<space>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

    -- Format
    bufmap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>')
  end
})

-- clangd
local clangd_config = require("taidaii.lsp.clangd")
lspconfig.clangd.setup(clangd_config)

