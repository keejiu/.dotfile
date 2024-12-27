-- Markdown
return {
	"GCBallesteros/jupytext.nvim",
	config = {
		custom_language_formatting = {
			python = {
				extension = "md",
				style = "markdown",
				force_ft = "markdown", -- you can set whatever filetype you want here
			},
		},
	},
	-- Depending on your nvim distro or config you may need to make the loading not lazy
	-- lazy=false,
}

-- Quarto
-- return {
-- 	"GCBallesteros/jupytext.nvim",
-- 	config = {
-- 		custom_language_formatting = {
-- 			python = {
-- 				extension = "qmd",
-- 				style = "quarto",
-- 				force_ft = "quarto", -- you can set whatever filetype you want here
-- 			},
-- 		},
-- 	},
-- 	-- Depending on your nvim distro or config you may need to make the loading not lazy
-- 	-- lazy=false,
-- }
