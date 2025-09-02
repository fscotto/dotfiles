return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim", -- Dependency for managing DAP adapters with Mason
      "mfussenegger/nvim-dap-python", -- Dependency for Python debugging
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local mason_dap = require("mason-nvim-dap")

      -- Configure mason-nvim-dap to automatically install DAP adapters
      mason_dap.setup({
        ensure_installed = {
          "delve", -- Go Debugger Adapter
          "codelldb", -- C/C++ Debugger Adapter
          "debugpy", -- Python Debugger Adapter
        },
        handlers = {},
      })

      -- Set up the DAP UI
      dapui.setup()

      -- Set up the Go debugging configurations
      require("dap-go").setup()

      -- Set up the Python debugging configurations
      require("dap-python").setup()

      -- Configure nvim-dap-virtual-text
      require("nvim-dap-virtual-text").setup({
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      })

      -- Configure the CodeLLDB adapter for C/C++
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- Define launch configurations for C/C++
      dap.configurations.c = {
        {
          name = "Launch C",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.cpp = dap.configurations.c

      -- Your keyboard shortcuts for debugging
      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
      vim.keymap.set("n", "<space>?", function()
        dapui.eval(nil, { enter = true })
      end)
      vim.keymap.set("n", "<F9>", dap.continue)
      vim.keymap.set("n", "<F7>", dap.step_into)
      vim.keymap.set("n", "<F8>", dap.step_over)
      vim.keymap.set("n", "<F6>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F12>", dap.restart)

      -- Listeners to open and close the DAP UI automatically
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
