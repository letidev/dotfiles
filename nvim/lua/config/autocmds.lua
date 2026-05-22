-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Reload files changed outside of nvim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "BufWinEnter", "WinEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
})

-- Refresh Snacks explorer git status when focus returns (e.g. after external git ops)
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    local git_ok, git = pcall(require, "snacks.explorer.git")
    local watch_ok, watch = pcall(require, "snacks.explorer.watch")
    if git_ok then
      git.refresh(vim.fn.getcwd())
    end
    if watch_ok then
      watch.refresh()
    end
  end,
})
