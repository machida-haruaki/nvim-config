return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    vim.opt.termguicolors = true
    require("bufferline").setup{}

    -- キーマップの設定
    local opts = { noremap = true, silent = true }

    -- Tab で次のバッファに移動
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)

    -- Shift+Tab で前のバッファに移動
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
  end
}

