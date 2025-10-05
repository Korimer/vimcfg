local default_location = vim.fn.expand([[~\vimsessions\default_session.vim]]);

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function onEnter()
  if file_exists(default_location)
    
  end
end

function onExit() {
  if vim.this_session then 
    vim.cmd("mks! " .. vim.this_session)
    os.remove(default_location)
  else
    vim.cmd("mks! " .. default_location)
  end
}

vim.api.nvim_create_autocmd({'VimEnter'}, {
  pattern = '*',
  group = autogroup,
  command = ''
  }
})

local autogroup = vim.api.nvim_create_autogroup('AutoSessions', {clear = false})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  group=autogroup,
  callback = onExit
})

vim.print("this at least ran lmfao")

