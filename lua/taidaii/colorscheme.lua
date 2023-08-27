local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  error("Failed to specify the color scheme: " .. colorscheme)
  return
end
