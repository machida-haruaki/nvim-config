return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- TypeScript LSP
    lspconfig.ts_ls.setup{}

    -- Python LSP
    lspconfig.pyright.setup{}

    -- Lua LSP
    lspconfig.lua_ls.setup{
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }

    -- Ruby LSP
    lspconfig.solargraph.setup{}

    -- HTML LSP
    lspconfig.html.setup{}

    -- CSS LSP
    lspconfig.cssls.setup{}

    -- JSON LSP
    lspconfig.jsonls.setup{}

    -- 共通のLSPキーマッピング
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "定義へジャンプ" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "ドキュメントを表示" })
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "変数名をリネーム" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "参照箇所を表示" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "コードアクションを実行" })
  end,
}

