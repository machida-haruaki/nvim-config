return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup{
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = true,
      },
    }
  end,
}

