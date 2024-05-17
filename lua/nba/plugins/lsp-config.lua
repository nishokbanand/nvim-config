return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      }
    })
    --
    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }
    --
    -- cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    --   mapping = cmp.mapping.preset.insert({
    --     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --   }),
    --   sources = cmp.config.sources({
    --     { name = 'nvim_lsp' },
    --     { name = 'luasnip' }, -- For luasnip users.
    --   }, {
    --       { name = 'buffer' },
    --     })
    -- })
    --
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     'williamboman/mason.nvim',
--     'williamboman/mason-lspconfig.nvim',
--     'WhoIsSethDaniel/mason-tool-installer.nvim',
--     "hrsh7th/cmp-nvim-lsp",
--     { "antosha417/nvim-lsp-file-operations", config = true },
--     { "folke/neodev.nvim",                   opts = {} },
--   },
--   config = function()
--     -- import lspconfig plugin
--     require('mason').setup()
--     local lspconfig = require("lspconfig")
--
--     -- import mason_lspconfig plugin
--     local mason_lspconfig = require("mason-lspconfig")
--
--     -- import cmp-nvim-lsp plugin
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
--     local keymap = vim.keymap -- for conciseness
--
--     vim.api.nvim_create_autocmd("LspAttach", {
--       group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--       callback = function(ev)
--         -- Buffer local mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local opts = { buffer = ev.buf, silent = true }
--
--
--         --         map('gd', require('telescope.builtin').lsp_definitions, )
--         --         map('gr', require('telescope.builtin').lsp_references, )
--         --         map('gI', require('telescope.builtin').lsp_implementations, )
--         --         map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--         --         map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--         --         map('<leader>ca', vim.lsp.buf.code_action, )
--         --         map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--         --         map('K', vim.lsp.buf.hover, 'Hover Documentation')
--         -- set keybinds
--         opts.desc = '[G]oto [R]eferences'
--         keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--         opts.desc = '[G]oto [D]efinition'
--         keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration
--
--         opts.desc = "Show LSP definitions"
--         keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--         opts.desc = '[G]oto [I]mplementation'
--         keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--         opts.desc = "Show LSP type definitions"
--         keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--         opts.desc = '[C]ode [A]ction'
--         keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--         opts.desc = "Smart rename"
--         keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--         opts.desc = "Show buffer diagnostics"
--         keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--         opts.desc = "Show line diagnostics"
--         keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--         opts.desc = "Go to previous diagnostic"
--         keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--         opts.desc = "Go to next diagnostic"
--         keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--         opts.desc = "Show documentation for what is under cursor"
--         keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--       end,
--     })
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--     local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
--     for type, icon in pairs(signs) do
--       local hl = "DiagnosticSign" .. type
--       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--     end
--
--       -- default handler for installed servers
--     mason_lspconfig.setup_handlers({
--       function(server_name)
--         lspconfig[server_name].setup({
--           capabilities = capabilities,
--         })
--       end,
--       ["emmet_ls"] = function()
--         -- configure emmet language server
--         lspconfig["emmet_ls"].setup({
--           capabilities = capabilities,
--           filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
--         })
--       end,
--       ["lua_ls"] = function()
--         lspconfig["lua_ls"].setup({
--           capabilities = capabilities,
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = 'Replace',
--               },
--             },
--           },
--         })
--       end,
--     })
--   end,
-- }
-- local capabilities = cmp_nvim_lsp.default_capabilities()
-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
