return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "bash-language-server",
      "clangd",
      "gopls",
      "lua_ls",
      "pylsp",
      "zls",
    },
  },
}
