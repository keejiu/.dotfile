-------------- catppuccin ------------------
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			transparent_background = true,
-- 			no_italic = true,
-- 		})
-- 		-- setup must be called before loading
-- 		vim.cmd.colorscheme("catppuccin-mocha")
-- 	end,
-- }
--
-- -------------- Nord ---------
-- return {
-- 	"shaunsingh/nord.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.nord_contrast = false
-- 		vim.g.nord_borders = false
-- 		vim.g.nord_disable_background = true
-- 		vim.g.nord_italic = false
-- 		vim.cmd.colorscheme("nord")
-- 	end,
-- }
-- ---------- Zenbones ---------
-- return {
-- 	"zenbones-theme/zenbones.nvim",
-- 	lazy = false,
-- 	dependencies = "rktjmp/lush.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.zenbones_darken_comments = 45
-- 		vim.g.zenwritten_transparent_background = true
-- 		vim.opt.background = "dark"
-- 		vim.cmd.colorscheme("zenwritten")
-- 	end,
-- }
--
-- -----------Vscode ---------
return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vscode").setup({
			style = "dark",
			-- Enable transparent background
			transparent = true,
			-- Enable italic comment
			italic_comments = false,
		})
		vim.cmd.colorscheme("vscode")
	end,
}

-- ----------VSCODE DARK ------------
-- return {
-- 	"tomasiser/vim-code-dark",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- vim.g.codedark_modern = 1
-- 		vim.g.codedark_conservative = 1
-- 		vim.g.codedark_transparent = 1
-- 		vim.cmd.colorscheme("codedark")
-- 	end,
-- }
