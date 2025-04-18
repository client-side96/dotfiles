local completion = {}

function completion.setup()
	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{ name = "nvim_lsp", group_index = 2 },
		},
		mapping = {
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		window = {
			completion = {
				side_padding = 0,
			},
		},
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = {
					menu = 50,
					abbr = 50,
				},
				ellipsis_char = "...",

				before = function(entry, vim_item)
					return vim_item
				end,
			}),
		},
	})
end

return completion
