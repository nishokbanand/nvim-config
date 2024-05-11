return {
  {
    "theprimeagen/harpoon",
    config = function ()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      vim.keymap.set("n","<leader>a",mark.add_file)
      vim.keymap.set("n","<C-e>",ui.toggle_quick_menu)
      vim.keymap.set("n","<C-h>",function () ui.nav_file(1) end)
      vim.keymap.set("n","<C-j>",function () ui.nav_file(2) end)
      vim.keymap.set("n","<C-k>",function () ui.nav_file(3) end)
      vim.keymap.set("n","<C-l>",function () ui.nav_file(4) end)
    end
  },
  {
    "mfussenegger/nvim-dap",
    keys={
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    }
  },
  {
    "leoluz/nvim-dap-go",
    config = true
  },
  {
    "olexsmir/gopher.nvim",
    dependencies={
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end
  },
  {
    "folke/trouble.nvim",
    config = function ()
      require("trouble").setup{
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
      vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
      vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup{
        filetype = {
          "javascript",
          "typescript",
          "html"
        }
      }
    end
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup({})
    end
  },
  {
    "hrsh7th/cmp-cmdline",
    config = function ()
      local cmp = require 'cmp'
      cmp.setup.cmdline({'/','?'},{
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {name = 'buffer'}
        }
      })
      cmp.setup.cmdline(":",{
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {name = 'path'}
        },{
            {name = 'cmdline'}
          })
      })
    end
  },
  {
    "hrsh7th/cmp-buffer",
  }
}
