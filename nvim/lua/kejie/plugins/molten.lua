return {

	"benlubas/molten-nvim",
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	dependencies = { "3rd/image.nvim" },
	build = ":UpdateRemotePlugins",
	init = function()
		-- these are examples, not defaults. Please see the readme
		vim.g.molten_output_win_max_height = 20

		-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
		vim.g.molten_auto_open_output = false

		-- this guide will be using image.nvim
		-- Don't forget to setup and install the plugin if you want to view image outputs
		vim.g.molten_image_provider = "image.nvim"

		-- optional, I like wrapping. works for virt text and the output window
		vim.g.molten_wrap_output = true

		-- Output as virtual text. Allows outputs to always be shown, works with images, but can
		-- be buggy with longer images
		vim.g.molten_virt_text_output = true

		-- this will make it so the output shows up below the \`\`\` cell delimiter
		vim.g.molten_virt_lines_off_by_1 = true
		vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
		vim.keymap.set("n", "<leader>eo", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
		vim.keymap.set("n", "<leader>md", ":MoltenDeinit<CR>", { silent = true, desc = "De-Initialize the plugin" })
		vim.keymap.set("n", "<leader>el", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
		vim.keymap.set(
			"v",
			"<leader>ev",
			":<C-u>MoltenEvaluateVisual<CR>gv",
			{ desc = "execute visual selection", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ow",
			":noautocmd MoltenEnterOutput<CR>",
			{ desc = "show / enter output window", silent = true }
		)
		-- if you work with html outputs:
		vim.keymap.set(
			"n",
			"<leader>ob",
			":MoltenOpenInBrowser<CR>",
			{ desc = "open output in browser", silent = true }
		)
		vim.keymap.set("n", "<leader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
		vim.keymap.set("n", "<leader>dd", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })
		vim.keymap.set("n", "<leader>mt", ":MoltenInterrupt<CR>", { desc = "stop running code", silent = true })
	end,
}
