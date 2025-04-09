-- lazy.nvim
-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      layout = function(source)
        if source == "explorer" then
          return { preset = "dropdown" }
        end
        return {
          layout = {
            backdrop = false,
            row = 3,
            width = 0.5,
            min_width = 80,
            height = 0.8,
            border = "none",
            box = "vertical",
            { win = "preview", title = "{preview}", height = 0.6, border = "rounded" },
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
          },
        }
      end,

      formatters = {
        file = {
          filename_first = true,
          truncate = 180,
        },
      },
    },
  },
  keys = {
    {
      "<leader>fp",
      function()
        Snacks.picker.projects({
          finder = "recent_projects",
          format = "file",
          confirm = "load_session",
          dev = { "c:\\git\\webclient\\frontend" },
          patterns = { "package.json" },
        })
      end,
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep({ exclude = { "package\\-lock.json", "server/" } })
      end,
      desc = "Projects test",
    },
  },
}
