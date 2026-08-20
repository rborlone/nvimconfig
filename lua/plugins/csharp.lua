return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "roslyn-language-server" } },
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      broad_search = true,
    },
    -- init corre antes de que se cargue el plugin (y por lo tanto antes de que
    -- su plugin/roslyn.lua llame vim.lsp.enable), asi el cmd_env ya esta puesto
    -- cuando el cliente arranca. El apphost resuelve el runtime tanto por
    -- DOTNET_ROOT como por el "dotnet" que encuentre primero en PATH; el
    -- entorno grafico trae ambos apuntando a ~/.dotnet (solo .NET 8), asi que
    -- hay que anteponer /usr/lib64/dotnet (instalado via dnf, tiene .NET 10)
    -- en los dos para que el servidor Roslyn arranque.
    init = function()
      vim.lsp.config("roslyn", {
        cmd_env = {
          DOTNET_ROOT = "/usr/lib64/dotnet",
          PATH = "/usr/lib64/dotnet:" .. vim.env.PATH,
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = { exclude = { "roslyn_ls" } },
    },
  },
}
