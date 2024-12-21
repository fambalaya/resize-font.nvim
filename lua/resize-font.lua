local default_opts = {
    min = 1,
    max = 50,
    keymaps = {
        zoom_in = { "<C-=>", "<C-ScroolWheelUp>" },
        zoom_out = { "<C-->", "<C-ScroolWheelDown>" },
    },
}

local function get_cur_font()
    local ft = vim.o.guifont
    if not ft then return end
    local font, size = ft:match("([^:]+):[hH](%d+)")
    return font, size
end

local function resize(d, opts)
    local font, size = get_cur_font()
    size = size + d
    if size < opts.min then size = opts.min end
    if size > opts.max then size = opts.max end
    vim.o.guifont = string.format("%s:h%d", font, size)
end

local function install_keymap(opts)
    local m = {
        zoom_in = function() resize(1, opts) end,
        zoom_out = function() resize(-1, opts) end,
    }
    local map = vim.keymap.set
    local opt = { noremap = true, silent = true }

    for k, v in pairs(m) do
        local t = opts.keymaps[k]
        if type(t) ~= "table" then t = { t } end
        for _, a in ipairs(t) do
            map({ "n", "i", "v" }, a, v, opt)
        end
    end
end

local setup = function(opts)
    local gui_running = vim.fn.has("gui_running") == 1
    if not gui_running then return end
    opts = vim.tbl_deep_extend("force", default_opts, opts)
    install_keymap(opts)
end
return { setup = setup }
