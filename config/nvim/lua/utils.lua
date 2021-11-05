local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap

local function opt(o, v, scopes)
	scopes = scopes or { o_s }
	for _, s in ipairs(scopes) do
		s[o] = v
	end
end

local function autocmd(group, cmds, clear)
	clear = clear == nil and false or clear
	if type(cmds) == "string" then
		cmds = { cmds }
	end
	cmd("augroup " .. group)
	if clear then
		cmd([[au!]])
	end
	for _, c in ipairs(cmd) do
		cmd("autocmd " .. c)
	end
	cmd([[augroup END]])
end

local function map(modes, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = opts.noremap == nil and true or opts.noremap
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		map_key(mode, lhs, rhs, opts)
	end
end

local os_name = vim.loop.os_uname().sysname
local global = {
	is_mac = {os_name == "Darwin"},
	is_linux = {os_name == "Linux"},
	is_windows = {os_name == "Windows" or os_name == "Windows_NT"},
}

return { opt = opt, autocmd = autocmd, map = map, global = global}
