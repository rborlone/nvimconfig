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
    -- DOTNET_ROOT como por el "dotnet" que encuentre primero en PATH, y cuando
    -- nvim arranca desde la GUI no hereda el PATH del shell, asi que hay que
    -- anteponer a mano la instalacion nueva del SDK (roslyn necesita >= 9).
    init = function()
      local roots = {
        vim.env.HOME .. "/.dotnet", -- macOS: dotnet-install.sh
        "/usr/lib64/dotnet", -- Fedora: dnf
      }
      for _, root in ipairs(roots) do
        if vim.fn.isdirectory(root) == 1 then
          vim.lsp.config("roslyn", {
            cmd_env = {
              DOTNET_ROOT = root,
              PATH = root .. ":" .. vim.env.PATH,
            },
          })
          break
        end
      end
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = { exclude = { "roslyn_ls" } },
    },
  },
}
