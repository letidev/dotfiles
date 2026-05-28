return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-e>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.hide()
          else
            cmp.show()
          end
        end,
      },
    },
  },
}
