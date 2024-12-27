return {
	"tadmccorkle/markdown.nvim",
	ft = { "quarto", "markdown" }, -- or 'event = "VeryLazy"'
	opts = {
		-- configuration here or empty for defaults
	},
	config = function()
		require("quarto").activate()
	end,
}
