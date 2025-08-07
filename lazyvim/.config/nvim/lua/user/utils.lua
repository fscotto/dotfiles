-- This file contains all custom functions for integrate external tools.

-- Meld for comparing and merging files
local M = {}

function M.meld_diff(file1, file2)
  if not file1 or not file2 then
    print("Usage: :lua require'user.utils'.meld_diff('file1', 'file2')")
    return
  end
  local cmd = string.format("meld '%s' '%s' &", file1, file2)
  os.execute(cmd)
end

return M
