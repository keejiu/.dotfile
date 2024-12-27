-- plugins/quarto.lua
return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("quarto").setup({
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				chunks = "all",
				languages = { "r", "python", "julia", "bash", "html" },
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" },
				},
				completion = {
					enabled = true,
				},
			},
			keymap = {
				-- NOTE: setup your own keymaps:
				hover = "H",
				definition = "gd",
				rename = "<leader>rn",
				references = "gr",
				format = "<leader>gf",
			},
			codeRunner = {
				enabled = false,
				default_method = "molten", -- 'molten' or 'slime'
			},
		})
		local runner = require("quarto.runner")
		vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
		vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
		vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
		vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
		vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
		vim.keymap.set("n", "<leader>RA", function()
			runner.run_all(true)
		end, { desc = "run all cells of all languages", silent = true })
	end,
	init = function()
		vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", { desc = "preview quarto", silent = true })
		vim.keymap.set("n", "<leader>qa", ":QuartoActivate<CR>", { desc = "activate quarto", silent = true })
	end,
}
