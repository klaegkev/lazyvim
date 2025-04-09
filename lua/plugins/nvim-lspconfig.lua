return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      angularls = {},
    },
    setup = {
      angularls = function(_, opts)
        LazyVim.lsp.on_attach(function(client)
          --HACK: disable angular renaming capability due to duplicate rename popping up
          client.server_capabilities.renameProvider = false
        end, "angularls")

        -- Konfiguriert angular lsp für monorepo
        opts.root_dir = require("lspconfig.util").root_pattern("angular.json", "nx.json")
        require("lspconfig").angularls.setup({ { server = opts } })
      end,
    },
  },
  --{
  --  "neovim/nvim-lspconfig",
  --  opts = function(_, opts)
  --    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
  --      {
  --        name = "@angular/language-server",
  --        location = LazyVim.get_pkg_path("angular-language-server", "/node_modules/@angular/language-server"),
  --        enableForWorkspaceTypeScriptVersions = false,
  --      },
  --    })
  --  end,
  --},
}
