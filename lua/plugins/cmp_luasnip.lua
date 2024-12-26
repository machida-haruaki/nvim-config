return {
  "saadparwaiz1/cmp_luasnip",
  dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" },
  config = function()
    local cmp = require("cmp")
    -- LuaSnipを補完ソースとして追加
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
      }),
    })
  end,
}

