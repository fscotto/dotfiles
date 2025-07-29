require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "json",
    "lua",
    "markdown",
    "python",
    "zig",
  },
  highlight = {
    enabled = true,
  },
  incremental_selection = {
    enabled = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
