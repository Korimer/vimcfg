local dashboard = require("alpha.themes.dashboard")

-- Custom header configuration
local ansi = vim.my.fn.fromscriptroot("_moon-ansi.lua")
local header = dofile(ansi)

-- Re-apply colors whenever i change colorscheme
vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
  nested = true,
  callback = function()
    dofile(ansi)
  end,
})

--- TELESCOPE DIRECTORY PICKER COMMAND ---
-- Creates a custom Telescope picker that only looks for directories
-- Note: This assumes you have 'fd' installed (which is standard for Telescope)
vim.api.nvim_create_user_command("AlphaChangeDir", function()
    local ok, builtin = pcall(require, "telescope.builtin")
    if not ok then
        vim.notify("Telescope not found", vim.log.levels.ERROR)
        return
    end

    builtin.find_files({
        prompt_title = "Change Directory (Press <CR> to select)",
        -- Use fd to find only directories, excluding .git
        find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
        -- You can change the starting directory by uncommenting the line below:
        -- cwd = vim.fn.expand("~"), 
        attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            
            -- Override the Enter key to change directory instead of opening a file
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.cmd("cd " .. vim.fn.fnameescape(selection.path))
                    -- Redraw Alpha to update the directory text
                    require("alpha").redraw()
                    print("Changed directory to: " .. selection.path)
                end
            end)
            return true
        end,
    })
end, {})


--- CURRENT DIRECTORY SECTION ---
local section_cwd = {
    type = "group",
    -- Wrapping val in a function ensures it re-evaluates the cwd every time Alpha redraws
    val = function()
        local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
        return {
            {
                type = "text",
                val = "  Current Folder: " .. cwd,
                opts = { hl = "String", position = "center" },
            },
            { type = "padding", val = 1 },
        }
    end,
}

--- RECENT SESSIONS SECTION ---
local function get_sessions(start, items_number)
    items_number = items_number or 5
    
    local ok, session_utils = pcall(require, "session_manager.utils")
    if not ok then
        return {
            type = "text",
            val = "Session Manager not found",
            opts = { hl = "WarningMsg", position = "center" }
        }
    end

    local sessions = session_utils.get_sessions()
    local tbl = {}
    local target_width = 35
    local plenary_path = require("plenary.path")

    for i, session in ipairs(sessions) do
        if i > items_number then break end

        local dir_path = tostring(session.dir)
        local short_fn = vim.fn.fnamemodify(dir_path, ":~")

        if #short_fn > target_width then
            short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
            if #short_fn > target_width then
                short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
            end
        end

        local shortcut = tostring(i + start - 1)
        local ico_txt = "  "
        local cmd = "<cmd>cd " .. vim.fn.fnameescape(dir_path) .. " <bar> SessionManager load_current_dir_session<CR>"
        
        local btn = dashboard.button(shortcut, ico_txt .. short_fn, cmd)
        btn.opts.hl = { 
            { "Comment", 0, #ico_txt }, 
            { "Normal", #ico_txt, #ico_txt + #short_fn } 
        }
        
        tbl[i] = btn
    end
    
    if #tbl == 0 then
        return {
            type = "text",
            val = "No recent sessions found",
            opts = { hl = "Comment", position = "center" }
        }
    end

    return { type = "group", val = tbl, opts = {} }
end

local section_mru_sessions = {
    type = "group",
    val = {
        {
            type = "text",
            val = "Recent Sessions",
            opts = {
                hl = "SpecialComment",
                shrink_margin = false,
                position = "center",
            },
        },
        { type = "padding", val = 1 },
        {
            type = "group",
            val = function()
                return { get_sessions(1, 5) }
            end,
            opts = { shrink_margin = false },
        },
    },
}

--- QUICK LINKS ---
local buttons = {
    type = "group",
    val = {
        { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("e", "  New file here", "<cmd>ene<CR>"),
        dashboard.button("o", "  Open Current Folder", "<cmd>e .<CR>"),
        dashboard.button("SPC f f", "󰈞  Find file"),
        dashboard.button("SPC f g", "󰊄  Live grep"),
        dashboard.button("c", "  Configuration", "<cmd>exe 'cd' stdpath ('config')<CR>"),
        dashboard.button("n", "  Nixos Configuration", "<cmd>exe 'cd' '/etc/nixos'<CR>"),
        dashboard.button("d", "󰉖  Change Directory", "<cmd>AlphaChangeDir<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    },
    position = "center",
}

--- LAYOUT ---
local config = {
    layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        section_cwd,
        section_mru_sessions,
        { type = "padding", val = 2 },
        buttons,
    },
    opts = {
        margin = 5,
        setup = function()
            vim.cmd('AlphaRemap')
            
            -- Tell Alpha to redraw itself whenever the directory changes
            vim.api.nvim_create_autocmd('DirChanged', {
                pattern = '*',
                group = vim.api.nvim_create_augroup('alpha_update_cwd', { clear = true }),
                callback = function()
                    -- Only redraw if Alpha is the current buffer to prevent errors
                    if vim.bo.filetype == "alpha" then
                        require('alpha').redraw()
                        vim.cmd('AlphaRemap')
                    end
                end,
            })
        end,
    },
}

return {
    header = header,
    buttons = buttons,
    section_cwd = section_cwd,
    section_mru_sessions = section_mru_sessions,
    config = config,
    leader = dashboard.leader,
}
