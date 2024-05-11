return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        typescript = { "prettierd" },
        javascript = { "prettierd" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      }
    })
  end
}
