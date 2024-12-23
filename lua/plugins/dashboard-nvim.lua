  -- スタート画面: dashboard-nvim
 return {
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("dashboard").setup {
        theme = 'hyper', -- テーマを設定（好みに応じて変更可能）
        config = {
          header = {
            "Welcome to Neovim!", -- ヘッダーに表示されるテキスト
          },
          center = {
            {
              icon = '  ',
              desc = 'Find File                 ',
              action = 'Telescope find_files',
              shortcut = 'SPC f f',
            },
            {
              icon = '  ',
              desc = 'New File                  ',
              action = 'enew',
              shortcut = 'SPC f n',
            },
          },
        },
      }
    end,
  },
}
