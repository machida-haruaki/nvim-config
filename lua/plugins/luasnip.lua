return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    -- スニペットの編集コマンド
    vim.api.nvim_create_user_command("LuaSnipEdit", function()
      require("luasnip.loaders").edit_snippet_files()
    end, {})
  end,
}

