return {
  -- "rebelot/kanagawa.nvim",
  -- "catppuccin/nvim",
  -- "craftzdog/solarized-osaka.nvim",
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({})

      -- setup must be called before loading
      vim.cmd.colorscheme "rose-pine"
    end,
  }
}
