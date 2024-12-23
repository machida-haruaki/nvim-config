return {
  -- ナビゲーション: hop.nvim
    {
    "phaazon/hop.nvim",
    branch = "v2", -- v2ブランチを使用
    config = function()
      require("hop").setup()
      -- キーマップを設定
      vim.api.nvim_set_keymap('n', '<leader>w', ":HopWord<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>c', ":HopChar1<CR>", { noremap = true, silent = true })
    end,
  },
}
