return {
  highlight = function()
    vim.lsp.buf.references(nil, {
      on_list = function(tbl)
        for _, item in ipairs(tbl.items) do
          if item.bufnr ~= nil and item.bufnr == vim.api.nvim_get_current_buf() then
            print(vim.inspect(item))
            vim.api.nvim_buf_set_extmark(
              0,
              0,
              item.lnum,
              item.col,
              { end_row = item.end_lnum, end_col = item.end_col, hl_group = "LspReference" }
            )
          end
        end
      end,
    })
  end,
}
