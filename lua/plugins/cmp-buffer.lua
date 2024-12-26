return {
  "hrsh7th/cmp-buffer",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    -- cmp-nvimのソースとしてバッファ補完を追加
    local cmp = require("cmp")
    cmp.setup({
      sources = cmp.config.sources({
        { name = "buffer" },
      }),
    })
  end,
}

