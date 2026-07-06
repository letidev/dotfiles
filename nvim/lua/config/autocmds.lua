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

-- Organize/sort imports and drop unused ones on save, mirroring VS Code's
-- "organizeImports" on save. This is a separate LSP request from formatting,
-- so eslint/prettier autoformat-on-save (already enabled by LazyVim) won't
-- trigger it on its own. vtsls returns unresolved code actions (edit is nil
-- until explicitly resolved), so each action needs a codeAction/resolve
-- round-trip before it can be applied.
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.mjs", "*.cjs", "*.astro" },
  callback = function(event)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = event.buf })) do
      if client:supports_method("textDocument/codeAction") then
        local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
        params.context = { only = { "source.organizeImports" }, diagnostics = {} }
        local resp = client:request_sync("textDocument/codeAction", params, 1000, event.buf)
        for _, action in ipairs((resp and resp.result) or {}) do
          if not action.edit and client:supports_method("codeAction/resolve") then
            local resolved = client:request_sync("codeAction/resolve", action, 1000, event.buf)
            action = (resolved and resolved.result) or action
          end
          if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
          end
        end
      end
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
