require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "go",
    "gomod",
    "gowork",
    "gosum",
    "json",
    "lua",
    "markdown",
    "python",
    "org",
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
