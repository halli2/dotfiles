require("neoterm").setup({
	--clear_on_run = true, -- run clear command before user specified commands
	mode = "horizontal", -- horizontal/vertical/fullscreen
	noinsert = false, -- disable entering insert mode when opening the neoterm window
})

--[[ local neoterm = require('neoterm')

neoterm.open()
-- Override global config on a specific open call
neoterm.open({ mode = 'vertical', noinsert = true})
neoterm.close()
neoterm.toggle()
neoterm.run('ls')
-- Control whether or not the screen is cleared before running the command
neoterm.run('ls', {clear = false})
neoterm.rerun()
neoterm.exit() ]]
