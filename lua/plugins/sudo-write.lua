local buffer_to_string = function()
  local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  return table.concat(content, "\n")
end

if vim.g.env == "WINDOWS" then
  vim.api.nvim_create_user_command("SW", function()
      local cur_file = vim.fn.expand('%')

      if vim.fn.file_readable(cur_file) == 0 then
        vim.notify("Error: File " .. cur_file .. " is not readable.")
        return
      end

      local buf_contents = buffer_to_string()
      local tmp_locale = vim.fn.stdpath('data') .. "/SudoWriteTmp"
      local f = io.open(tmp_locale,"w+")

      if f == nil then
        vim.notify("Error: cannot open tmp locale " .. tmp_locale)
        return
      else
        f:write(buf_contents)
        f:flush()
        f:close()
      end

      vim.cmd(
        "!powershell "              ..
        "start-process powershell " ..
        "-Verb runas "              ..
        "-ArgumentList @("          ..
          "'-c',"                   ..
          "'Get-Content',"          ..
          "'" .. tmp_locale .. "'," ..
          "'^|',"                   ..
          "'Set-Content',"          ..
          "'" .. cur_file .. "'"    ..
        ")"
      )

    end,
    {}
  )
end

return {
  "https://github.com/lambdalisue/vim-suda",
  cond = vim.g.env == "LINUX",
}
