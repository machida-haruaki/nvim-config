  -- 検索と置換: spectre.nvim
  return {
   {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("spectre").setup()
      -- キーマップを設定
      vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>sw', ":lua require('spectre').open_visual({select_word=true})<CR>", { noremap = true, silent = true })
    end,
  },
}
