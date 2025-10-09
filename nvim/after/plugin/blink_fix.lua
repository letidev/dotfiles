-- after/plugin/blink_fix.lua
-- Disable Blink's dynamic <C-k> keymap completely

vim.schedule(function()
  local ok, keymap = pcall(require, "blink.cmp.keymap.apply")
  if not ok or type(keymap) ~= "table" then
    return
  end

  -- Monkey-patch Blink's apply_keymaps function to skip <C-k>
  local old_apply = keymap.apply
  keymap.apply = function(maps, ...)
    if type(maps) == "table" then
      maps["<C-k>"] = nil
    end
    return old_apply(maps, ...)
  end

  -- Delete any existing <C-k> insert-mode binding
  pcall(vim.keymap.del, "i", "<C-k>")

  -- Apply movement mapping instead
  vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up in insert mode" })
end)
