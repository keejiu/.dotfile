return {
	"jbyuki/nabla.nvim",
	config = function()
		vim.api.nvim_create_user_command("PopUp", require("nabla").popup, {})
		vim.keymap.set("n", "<leader>pl", ":PopUp<CR>", { silent = true, desc = "popup latex" })
	end,
}
