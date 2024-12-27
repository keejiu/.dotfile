-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Refresh the images in the current buffer
-- Useful if you delete an actual image file and want to see the changes
-- without having to re-open neovim
keymap.set("n", "<leader>ir", function()
	-- First I clear the images
	-- I'm using [[ ]] to escape the special characters in a command
	vim.cmd([[lua require("image").clear()]])
	-- Reloads the file to reflect the changes
	vim.cmd("edit!")
	print("Images refreshed")
end, { desc = "Refresh images" })

-- Set up a keymap to clear all images in the current buffer
keymap.set("n", "<leader>ic", function()
	-- This is the command that clears the images
	-- I'm using [[ ]] to escape the special characters in a command
	vim.cmd([[lua require("image").clear()]])
	print("Images cleared")
end, { desc = "Clear images" })

-- Open image under cursor in the Preview app (macOS)
keymap.set("n", "<leader>io", function()
	local function get_image_path()
		-- Get the current line
		local line = vim.api.nvim_get_current_line()
		-- Pattern to match image path in Markdown
		local image_pattern = "%[.-%]%((.-)%)"
		-- Extract relative image path
		local _, _, image_path = string.find(line, image_pattern)

		return image_path
	end

	-- Get the image path
	local image_path = get_image_path()

	if image_path then
		-- Check if the image path starts with "http" or "https"
		if string.sub(image_path, 1, 4) == "http" then
			print("URL image, use 'gx' to open it in the default browser.")
		else
			-- Construct absolute image path
			local current_file_path = vim.fn.expand("%:p:h")
			local absolute_image_path = current_file_path .. "/" .. image_path

			-- Construct command to open image in Preview
			local command = "open -a Preview " .. vim.fn.shellescape(absolute_image_path)
			-- Execute the command
			local success = os.execute(command)

			if success then
				print("Opened image in Preview: " .. absolute_image_path)
			else
				print("Failed to open image in Preview: " .. absolute_image_path)
			end
		end
	else
		print("No image found under the cursor")
	end
end, { desc = "(macOS) Open image under cursor in Preview" })
