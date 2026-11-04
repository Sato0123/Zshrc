return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        enabled = true,
      },
      -- pyrightと競合しないように
      pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- ruffに任せる
          },
          python = {
            analysis = {
              ignore = { "*" }, -- lint系はruffに任せる
            },
          },
        },
      },
    },
  },
}
