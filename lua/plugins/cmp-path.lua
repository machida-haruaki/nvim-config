return {
  "hrsh7th/cmp-path",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    -- cmp-nvimのソースとしてパス補完を追加
    local cmp = require("cmp")
    cmp.setup({
      sources = cmp.config.sources({
        { name = "path" },
      }),
    })
  end,
}

