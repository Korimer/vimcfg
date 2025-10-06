local default_location = vim.fn.expand([[~\vimsessions\default_session.vim]]);

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function onEnter()
    vim.print("file location is: " .. default_location)
    if file_exists(default_location) then
      vim.print("Session Memory: Loading default session")
      vim.cmd("source " .. default_location)
    else
      vim.print("No default session found.")
    end
end

function onExit() 
  if vim.this_session then 
    vim.cmd("mks! " .. vim.v.this_session)
    os.remove(default_location)
  else
    vim.cmd("mks! " .. default_location)
  end
end

local autogroup = vim.api.nvim_create_augroup('AutoSessions', {clear = true})

vim.api.nvim_create_autocmd('VimEnter', {
  group=autogroup,
  callback=onEnter
})

vim.api.nvim_create_autocmd("VimLeave", {
  group=autogroup,
  callback = onExit
})

vim.print(file_exists(default_location))


