local opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- Normal --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
keymap("t", "<C-[>", "<C-\\><C-N>", opts)  -- Exit terminal mode

-- Telescope --
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- toggleterm
keymap("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)
