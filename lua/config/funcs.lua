local M = {}

function M.fileExists(file)
  local f=io.open(file,"r")
  if f~=nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.concatPath(path_items, sep)
  sep = sep ~= nil and sep
    or vim.g.env == "WINDOWS" and "\\" 
    or "/"
  return vim.fn.join(path_items,sep)
end

return M
