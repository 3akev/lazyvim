if string.find(vim.fn.expand("%"), "%.ju%.py") ~= nil then
  -- jupynium file

  -- disable inline diagnostics for this buffer
  vim.diagnostic.disable(0)
end
