return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  config = function()
    local lsp_servers = { "lua_ls", "ruff", "html", "yamlls", "jsonls", "solargraph", "cssls" }
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
  end,
}

