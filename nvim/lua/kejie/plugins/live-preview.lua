return {
	"brianhuster/live-preview.nvim",
	dependencies = {
		"brianhuster/live-preview.nvim",
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
		"echasnovski/mini.pick",
	},
	config = function()
		require("live-preview").setup()
		opts = {}
		vim.keymap.set("n", "<leader>ps", ":LivePreview start<CR>", { silent = true, desc = "start live preview" })
	end,
}
