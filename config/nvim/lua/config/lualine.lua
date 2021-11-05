require("lualine").setup({
	options = {
		theme = "onedark",
	},
    --[[ sections = {
        lualine_c = {"os.date('%a')", 'data', "require'lsp-status'.status()"}
    } ]]
})
