return {
  "rafamadriz/friendly-snippets",
  dependencies = { "L3MON4D3/LuaSnip" },
  config = function()
    -- Friendly-snippetsをロード
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

