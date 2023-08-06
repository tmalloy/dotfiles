return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
