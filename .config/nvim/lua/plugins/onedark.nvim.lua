return {
  -- "rebelot/kanagawa.nvim",
  "bluz71/vim-moonfly-colors",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins

  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme moonfly]])
  end,
}
