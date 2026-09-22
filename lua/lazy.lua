local allModules = {}
local moduleRoot = vim.fs.joinpath(vim.fn.stdpath("config"), "modules")
for name, ftype, err in vim.fs.dir(moduleRoot, {depth=9}) do
  if ftype == "file" and string.match(name,"[.]lua$") then
    allModules[#allModules+1] = { import = name }
  end
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.print(allModules)
-- Setup lazy.nvim
require("lazy").setup({
  git = {
    url_format = 
      (vim.g.env == "WINDOWS" and "https://github.com/%s.git")
      or (vim.g.env == "LINUX" and "git@github.com:/%s.git")
    },
  spec = allModules,
  change_detection = {
    enabled = true,
    notify = false,
  },
  -- No luarocks
  rocks = { enabled = false },
  -- automatically check for plugin updates once a day
  checker = { enabled = true, frequency = (60*60*24) },
})
