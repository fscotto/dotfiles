return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- C
        null_ls.builtins.formatting.clang_format.with({
          extra_args = {
            "--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWith: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, AllowShortLoopsOnASingleLine: false, AllowShortFunctionsOnASingleLine: InlineOnly, ColumnLimit: 80, AlignConsecutiveDeclarations: false, AlignConsecutiveAssignments: false, AlignEscapedNewlines: Left, AlignOperands: false, IndentCaseLabels: false, SpaceBeforeParens: ControlStatements }",
          },
        }),

        -- Go
        null_ls.builtins.formatting.goimports,

        -- Zig
        null_ls.builtins.formatting.zigfmt,

        -- Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "4",
            "--column-width",
            "100",
          },
        }),

        -- Python
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length", "79" },
        }),

        -- Shell
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2", "-ci", "-bn", "-sr", "-p" },
        }),
      },

      -- Auto-format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
