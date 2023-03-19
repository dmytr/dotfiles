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
}

