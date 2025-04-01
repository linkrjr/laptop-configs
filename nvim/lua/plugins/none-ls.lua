return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.rubocop,
				require("none-ls.diagnostics.eslint"),
        null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.pylint.with({
					diagnostic_config = { underline = false, vistual_text = false, signs = false },
					method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
