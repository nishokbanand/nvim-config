return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup {
      icons = false,
      fold_open = "v",      -- icon used for open folds
      fold_closed = ">",    -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        --{ Error = " ", Warn = " ", Hint = " ", Info = "" }
        error = "",
        warning = "",
        hint = "󰠠",
        information = ""
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
      { desc = "[T]oggle document diagnostics" })
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
      { desc = "[T]oggle workspace_diagnostics" })
    vim.keymap.set("n", "[d", function() require("trouble").next({ skip_groups = true, jump = true }) end)
    vim.keymap.set("n", "]d", function() require("trouble").previous({ skip_groups = true, jump = true }) end)
  end
}
