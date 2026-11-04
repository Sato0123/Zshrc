-- ~/.config/nvim/lua/plugins/emmet.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {},
        tailwindcss = {},
        html = {},
      },
    },
  },
}
