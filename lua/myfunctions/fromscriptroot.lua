vim.my.fn.fromscriptroot = function (filename)
  local mypath = debug.getinfo(2, "S").source:sub(2)
  local mydir = vim.fn.fnamemodify(mypath,":h")
  local localfile = vim.fs.joinpath(mydir, filename)
  vim.print(localfile)
  return localfile
end
