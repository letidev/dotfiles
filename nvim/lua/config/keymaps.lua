-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove LazyVim's LSP <C-k> (signature help) in insert mode
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf = event.buf
    -- Schedule after LazyVim’s keymaps have been applied
    vim.schedule(function()
      pcall(vim.keymap.del, "i", "<C-k>", { buffer = buf })
    end)
  end,
})

-- Map movement keys
local map = vim.keymap.set
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
map("i", "<C-l>", "<Right>")

-- Move signature help elsewhere
map("i", "<C-S-k>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Signature help (moved from <C-k>)" })
