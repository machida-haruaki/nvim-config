-- nvim-tree の設定を返す
return {
  "kyazdani42/nvim-tree.lua",
  requires = { "kyazdani42/nvim-web-devicons" }, -- アイコンをサポート
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true, -- ネイティブのファイラーを無効化
      hijack_netrw = true, -- nvim-tree に乗っ取らせる
      renderer = {
        highlight_opened_files = "name", -- 開いているファイルをハイライト
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      view = {
        width = 30, -- サイドバーの幅
        side = "left", -- 表示位置
      },
    })

    -- 起動時にディレクトリを自動的に開く
    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function(data)
        local directory = vim.fn.isdirectory(data.file) == 1
        if not directory then
          return
        end
        require("nvim-tree.api").tree.open()
      end,
    })

    -- ファイラーのフォーカスをトグルする関数
    local toggle_nvim_tree_focus = function()
      local view = require("nvim-tree.view")
      if view.is_visible() and view.get_winnr() == vim.api.nvim_get_current_win() then
        -- NvimTree がフォーカスされている場合、フォーカスを外す
        vim.cmd("wincmd p")
      else
        -- NvimTree にフォーカスを移す
        vim.cmd("NvimTreeFocus")
      end
    end

    -- キーマップの設定
    local opts = { noremap = true, silent = true }

    vim.keymap.set(
      "n",
      "<C-m>",
      toggle_nvim_tree_focus,
      { noremap = true, silent = true, desc = "Toggle NvimTree Focus" }
    )

    vim.keymap.set(
      "n",
      "<C-f>",
      ":NvimTreeToggle<CR>",
      { noremap = true, silent = true, desc = "Toggle NvimTree" }
    ) -- Ctrl+f でファイラーを開閉
  end,
}

