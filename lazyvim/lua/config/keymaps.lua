-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--- For Mac
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "QQ", "<CMD>q!<CR>")
vim.keymap.set("n", "<C-j>", "<CMD>bn<CR>")
vim.keymap.set("n", "<C-k>", "<CMD>bp<CR>")
vim.keymap.set("n", "<C-b>", "<CMD>bd<CR>")
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("n", "<leader>doc", function()
  require("neogen").generate()
end, { desc = "Generate docstring" })
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_D')
vim.keymap.set("x", "x", '"_x')
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
