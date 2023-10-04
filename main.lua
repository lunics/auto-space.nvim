local dictionary_fr = {
  "je",
  "veux",
  "du",
  "chocolat",
  "a",
  "avec",
}

local function get_current_word()
  local line       = vim.fn.getline('.')
  local cursor_col = vim.fn.col('.')
  local start_col  = cursor_col

  -- find the begining of the current typed word
  while start_col > 0 and line:sub(start_col - 1, start_col - 1):match("%w") do
    start_col = start_col - 1
  end

  -- return the current writing word
  return line:sub(start_col, cursor_col)
end

function autospace()
  local current_word = get_current_word()
  local same = false

  for i = 1, #dictionary_fr do
    if current_word == dictionary_fr[i] then
      same = true
      vim.api.nvim_feedkeys(' ', 'n', false)
    end
  end

  if same then
    vim.api.nvim_out_write("Word found: " .. current_word .. "\n")
  end

  -- vim.api.nvim_out_write(sqlite.list_matches("mange") .. "\n")
end

-- run autospace function after each typed character
vim.cmd([[autocmd TextChanged,TextChangedI * lua autospace()]])
