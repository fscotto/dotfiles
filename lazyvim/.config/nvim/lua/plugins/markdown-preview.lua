return {
  -- Browser preview plugin
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_browser = "firefox" -- use your preferred browser
      vim.g.mkdp_sync_scroll_type = "middle"
    end,
    ft = { "markdown" },
    keys = {
      {
        "<leader>Mp",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "Preview Markdown (Browser)",
      },
    },
  },

  -- Terminal-based preview with Glow
  {
    "ellisonleao/glow.nvim",
    config = true, -- uses default config
    cmd = "Glow",
    ft = { "markdown" },
    keys = {
      {
        "<leader>Mg",
        "<cmd>Glow<CR>",
        desc = "Preview Markdown (Glow)",
      },
    },
  },
}
