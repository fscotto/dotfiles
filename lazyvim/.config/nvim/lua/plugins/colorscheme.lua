return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = false,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    -- vim.cmd.colorscheme("catppuccin-mocha")
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
