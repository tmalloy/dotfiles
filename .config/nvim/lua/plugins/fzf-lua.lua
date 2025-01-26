return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>"},
    { "<leader>bl", "<cmd>FzfLua buffers<cr>"},
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>"},
  }
}
