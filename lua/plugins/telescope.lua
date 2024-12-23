return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        sorting_strategy = "ascending", -- 結果を昇順で表示
        prompt_prefix = "🔍 ", -- プロンプトの先頭に表示される文字
        layout_config = {
          horizontal = { width = 0.9, height = 0.8 }, -- レイアウト設定
        },
        -- 部分一致の設定
        find_command = { "rg", "--files", "--fixed-strings", "--ignore-case" },
        grep_command = { "rg", "--fixed-strings", "--ignore-case" },
      },
    }

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope list buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
