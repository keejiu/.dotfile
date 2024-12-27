return {

	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		floating_window = false,
		always_trigger = false,
	},

	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,

	init = function()
		-- toogle signature
		vim.keymap.set({ "n" }, "<leader>ph", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "toggle signature" })
	end,
}
