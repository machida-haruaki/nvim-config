return {
  "hrsh7th/cmp-nvim-lsp",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- 各LSPサーバーに能力を適用
    lspconfig.ts_ls.setup{ capabilities = capabilities }
    lspconfig.pyright.setup{ capabilities = capabilities }
    lspconfig.lua_ls.setup{ capabilities = capabilities }
    lspconfig.html.setup{ capabilities = capabilities }
    lspconfig.cssls.setup{ capabilities = capabilities }
  end,
}

