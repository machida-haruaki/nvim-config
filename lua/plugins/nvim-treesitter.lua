return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "ruby", "html", "css", "javascript", "json" }, -- 必要な言語を指定
      highlight = {
        enable = true, -- シンタックスハイライトを有効化
      },
      indent = {
        enable = true, -- 自動インデントを有効化
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- 選択の開始
          node_incremental = "grn", -- 範囲を広げる
          scope_incremental = "grc", -- スコープを広げる
          node_decremental = "grm", -- 範囲を狭める
        },
      },
    }
  end,
}

