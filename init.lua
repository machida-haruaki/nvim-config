local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新の安定版
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.cmd [[colorscheme gruvbox]]

-- Leaderキーを Space に設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim のセットアップ
require("lazy").setup("plugins")

-- plugins ディレクトリのすべてのファイルを require
local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins"
for _, file in ipairs(vim.fn.readdir(plugins_path)) do
  local plugin = file:gsub("%.lua$", "") -- 拡張子を取り除く
  require("plugins." .. plugin)
end

-- キーマップ設定用のヘルパー
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

