return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup{
      icons = true,
      mode = "workspace_diagnostics", -- 使用する診断モード
      fold_open = "",
      fold_closed = "",
      action_keys = {
        close = "q",
        cancel = "<esc>",
      },
    }
  end,
}

