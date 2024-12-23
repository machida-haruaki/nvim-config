return {
  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  },
  -- シンタックスハイライト
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  -- ファジーファインダー
  {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  },
  -- テーマ
  {
    "gruvbox-community/gruvbox",
  },
  -- ファイラー
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- アイコン表示
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- バッファライン
  {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {}
    end,
  },
}

