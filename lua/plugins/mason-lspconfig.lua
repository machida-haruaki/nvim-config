return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  config = function()
    local lsp_servers = { "lua_ls", "ruff", "html", "yamlls", "jsonls", "solargraph" }
    local diagnostics = { "typos_lsp" }
    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
    }
    require("mason-lspconfig").setup_handlers {
      function(server_name)
        local nvim_lsp = require("lspconfig")

        -- Solargraph (Rails 用 LSP)
        if server_name == "solargraph" then
          nvim_lsp.solargraph.setup {
            settings = {
              solargraph = {
                diagnostics = true, -- 診断を有効化
                formatting = true, -- 自動フォーマットを有効化
                completion = true, -- 補完機能を有効化
                useBundler = false, -- プロジェクトごとの Bundler 管理を無効化
              },
            },
          }
        end
      end,
    }

    -- キーマッピング
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', 'gt', '<C-t>')
    vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  end,
}

