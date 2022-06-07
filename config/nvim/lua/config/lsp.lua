local nvim_lsp = require("lspconfig")

--[[ local utils = require("utils")
local global = utils.global ]]

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<leader>re", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<localleader>n", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<localleader>p", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    buf_set_keymap("n", "<leader>T", '<cmd>lua require"lsp_extensions".inlay_hints()<CR>', opts)

    if vim.fn.has("nvim-0.8") == 1 then
        if client.server_capabilities.documentFormattingProvider then -- New format uses the same key/value as the LSP ServerCapabilities
            vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        end
    else
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        end
    end

    -- Virtual text
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            bufnr = bufnr or 0
            local line_nr = (vim.api.nvim_win_get_cursor(0)[1] - 1)
            local options = { ["lnum"] = line_nr }

            local line_diagnostics = vim.diagnostic.get(bufnr, options)
            if vim.tbl_isempty(line_diagnostics) then
                return
            end

            local diagnostic_message = ""
            for i, diagnostic in ipairs(line_diagnostics) do
                diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
            end
            vim.api.nvim_buf_set_virtual_text(
                bufnr,
                1,
                line_nr,
                { { diagnostic_message, "LspDiagnosticsDefaultError" } },
                {}
            )
        end,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = function()
            vim.api.nvim_buf_clear_namespace(bufnr, 1, 0, -1)
        end,
    })
    --[[ vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local curs_opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, curs_opts)
		end,
	}) ]]
    -- Don't show unlesss hovering
    vim.diagnostic.config({ virtual_text = false })
end

-- tabnine for cmp
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
    max_lines = 1000,
    max_num_results = 2,
    sort = true,
    run_on_every_keystroke = true,
})

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local luasnip = require("luasnip")
-- Setup nvim-cmp.
local cmp = require("cmp")
-- Set completeopt to have better completion experience
vim.o.completeopt = "menuone,noinsert"

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        -- `:help ins-completion`
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

        -- Add snippet support, fallback to default settings when not in use
        ["<c-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("neogen").jumpable() then
                require("neogen").jump_next()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),

        ["<c-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("neogen").jumpable(true) then
                require("neogen").jump_prev()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        --    the order of your sources matter (by default). That gives them priority
        --    you can configure:
        --        keyword_length
        --        priority
        --        max_item_count
        --        (more?)
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "cmp_tabnine" },
        { name = "buffer", keyword_length = 5 },
        { name = "path", keyword_length = 5 },
        -- { name = 'nvim_lua' },
        -- { name = "treesitter" },
        -- { name = 'calc' },
        -- { name = 'emoji' },
        -- { name = 'spell' },
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                cmp_tabnine = "[TN]",
            })[entry.source.name]
            return vim_item
        end,
    },
    experimental = {
        -- Prettier, menu
        native_menu = false,
        -- What's this
        ghost_text = true,
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

--[[ local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end ]]

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("null-ls").setup({
    on_attach = on_attach,
    sources = {
        require("null-ls").builtins.formatting.stylua,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.diagnostics.write_good,
        -- null_ls.builtins.diagnostics.pylint,
    },
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pylsp", "html", "cmake", "tsserver", "sumneko_lua" } -- "pyright""gopls" "ccls",
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        flags = {
            -- debounce_text_changes = 125,
        },
        capabilities = capabilities,
    })
end

nvim_lsp["bashls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "sh", "zsh", "zshrc" },
})

nvim_lsp["sumneko_lua"].setup({
    on_attach = on_attach,
    flags = {
        -- debounce_text_changes = 125,
    },
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

nvim_lsp["texlab"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                onSave = true,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = true,
            },
            latexindent = {
                modifyLineBreaks = true,
            },
        },
    },
})

-- vim.cmd([[autocmd BufEnter *.crs set filetype=rust]])

require("rust-tools").setup({
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    loadOutDirsFromCheck = true,
                    allFeatures = true,
                },
                procMacro = {
                    enable = true,
                },
                checkOnSave = {
                    command = "clippy",
                    allTargets = false, -- For embed, because of errors when using no_std
                },
                --[[ rustcSource = "discover",
				updates = {
					channel = "nightly",
				}, ]]
            },
        },
    },
})

-- Clangd
require("clangd_extensions").setup({
    server = {
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
            "clangd",
            "--header-insertion=never",
        },
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
            memory_usage = {
                border = "none",
            },
            symbol_info = {
                border = "none",
            },
        },
    },
})
