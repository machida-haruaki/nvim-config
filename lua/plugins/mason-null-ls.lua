return {
  "jayp0521/mason-null-ls.nvim",
  dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
  config = function()
    local mason_null_ls = require("mason-null-ls")

    mason_null_ls.setup({
      ensure_installed = { "eslint_d", "prettierd" }, -- 必要なフォーマッターやリンター
      automatic_installation = true,
    })

    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d,
        {
          name = "erb_lint", -- カスタム診断ツールとして erb_lint を設定
          method = null_ls.methods.DIAGNOSTICS,
          filetypes = { "eruby" }, -- 対応するファイルタイプ
          generator = {
            command = "erb_lint",
            args = { "--format", "json", "--stdin" },
            to_stdin = true,
            from_stderr = false,
            format = "json",
            check_exit_code = function(code)
              return code == 0 or code == 1
            end,
            on_output = function(params)
              local diagnostics = {}
              for _, item in ipairs(params.output) do
                table.insert(diagnostics, {
                  row = item.location.start.line,
                  col = item.location.start.column,
                  end_row = item.location["end"].line,
                  end_col = item.location["end"].column,
                  message = item.message,
                  severity = null_ls.severities[item.severity] or null_ls.severities.ERROR,
                  source = "erb_lint",
                })
              end
              return diagnostics
            end,
          },
        },
      },
    })
  end,
}

