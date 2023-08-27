local M = { "nvim-telescope/telescope.nvim" }

-- Release branch
M.branch = "0.1.x"

M.dependencies = { 
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
}

M.config = function()
  -- Load telescope
  status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    error("Failed to load telescope!")
  end
  -- Set up telescope with the fzf extension
  telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
  })
  -- Load the fzf extension
  telescope.load_extension("fzf")
end

M.lazy = true

M.cmd = "Telescope" 

return M
