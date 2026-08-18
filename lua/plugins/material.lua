return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker", -- "darker" | "lighter" | "oceanic" | "palenight" | "deep ocean"
    },
    config = function(_, opts)
      require("material").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
