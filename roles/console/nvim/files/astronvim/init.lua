return {
  colorscheme = "gruvbox",

  plugins = {
    {
      "ellisonleao/gruvbox.nvim",
      as = "gruvbox",
      config = function()
        require("gruvbox").setup {
          italic = false,
          contrast = "", -- can be "hard", "soft" or empty string
        }
      end,
    },
  },

  heirline = {
    colors = function(colors)
      local status = require "astronvim.utils.status"
      local C = status.env.fallback_colors
      local get_hlgroup = require("astronvim.utils").get_hlgroup

      local bg1 = get_hlgroup("GruvboxBg1", nil)
      local fg1 = get_hlgroup("GruvboxFg4", nil)

      if bg1 ~= nil then
        colors.tabline_bg = bg1.fg
        colors.section_bg = bg1.fg
        colors.bg = bg1.fg
      end

      if fg1 ~= nil then
        colors.section_fg = fg1.fg
      end

      return colors
    end,
  },
}

