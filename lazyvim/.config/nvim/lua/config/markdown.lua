require("render-markdown").setup({
  heading = { position = "inline" },
  quote = { repeat_linebreak = true },
  win_options = {
    showbreak = {
      default = "",
      rendered = "  ",
    },
    breakindent = {
      default = false,
      rendered = true,
    },
    breakindentopt = {
      default = "",
      rendered = "",
    },
  },
  checkbox = {
    unchecked = { icon = "✘ " },
    checked = { icon = "✔ " },
  },
  code = {
    position = "right",
    width = "block",
    right_pad = 10,
  },
  latex = {
    enabled = false,
  },
  link = {
    custom = {
      c = {
        pattern = "%.[ch]$",
        icon = " ",
      },
      golang = {
        pattern = "%.go$",
        icon = " ",
      },
      python = {
        pattern = "%.py$",
        icon = "󰌠 ",
      },
      lua = {
        pattern = "%.lua$",
        icon = " ",
      },
      -- shell = {
      --   pattern = "%.[sh|zsh]$",
      --   icon = " ",
      -- },
    },
  },
})
