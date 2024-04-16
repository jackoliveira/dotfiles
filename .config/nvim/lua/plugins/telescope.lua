return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"Slotos/telescope-lsp-handlers.nvim",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				defaults = {
					file_ignore_patterns = {
						--  "node_modules",
						--  "debugger*/",
						".git*/",
						--  ".github/*",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("harpoon")
			require("telescope").load_extension("ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

			--  apt-get install ripgrep
			--  vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fp", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>gd", builtin.git_status, {})
			vim.keymap.set("n", "<leader>gS", builtin.git_stash, {})
			vim.keymap.set("n", "<leader>h", "<cmd>:Telescope harpoon marks<CR>", {})
			--  vim.keymap.set('n', '<leader>bb', builtin.lsp_definitions, {})
			--  vim.keymap.set('n', '<leader>jd', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})
			--  :Telescope live_grep search_dirs={"app/","lib/"}
			--  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
		end,
	},
}
