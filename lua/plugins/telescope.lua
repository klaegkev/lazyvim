return {
  "nvim-telescope/telescope.nvim",
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "vertical",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      -- winblend = 10,
      path_display = { "filename_first" },
    },
  },
}
