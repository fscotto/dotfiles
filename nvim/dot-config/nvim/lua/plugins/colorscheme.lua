return {
  "Mofiqul/adwaita.nvim",
  name = "adwaita",
  lazy = false,
  priority = 1000,
  -- configure and set on startup
  config = function()
    vim.g.adwaita_darker = false
    vim.g.adwaita_disable_cursorline = true
    vim.g.adwaita_transparent = false
    vim.cmd("colorscheme adwaita")
  end,
}
