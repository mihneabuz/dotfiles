local packer_bootstrap local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

local success, packer = pcall(require, "packer")
if not success then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end
	}
})

return require("packer").startup(
	function(use)
	  -- packer
		use "wbthomason/packer.nvim"

		-- dependencies
		use "antoinemadec/FixCursorHold.nvim"
		use "winston0410/cmd-parser.nvim"
		use "nvim-lua/popup.nvim"
		use "nvim-lua/plenary.nvim"

		-- impacient
		use "lewis6991/impatient.nvim"

		-- general
		use "kyazdani42/nvim-web-devicons"
		use "windwp/nvim-autopairs"
		use "norcalli/nvim-colorizer.lua"
		use "folke/todo-comments.nvim"
		use "winston0410/range-highlight.nvim"
		use "jghauser/fold-cycle.nvim"
		use "sudormrfbin/cheatsheet.nvim"
		use "dstein64/vim-startuptime"

		-- colorscheme
		use "navarasu/onedark.nvim"

		-- comments
		use "numToStr/Comment.nvim"
		use "JoosepAlviste/nvim-ts-context-commentstring"

		-- completion
		use "hrsh7th/nvim-cmp"         -- completion plugin
		use "hrsh7th/cmp-buffer"       -- buffer completions
		use "hrsh7th/cmp-path"         -- path completions
		use "hrsh7th/cmp-cmdline"      -- cmdline completions
		use "hrsh7th/cmp-nvim-lsp"     -- lsp completion
		use "hrsh7th/cmp-nvim-lua"     -- nvim lua completion
		use "saadparwaiz1/cmp_luasnip" -- snippet completions

		-- snippets
		use "L3MON4D3/LuaSnip"
		use "rafamadriz/friendly-snippets"

		-- lsp
		use "neovim/nvim-lspconfig"
		use "jose-elias-alvarez/null-ls.nvim"
		use "williamboman/nvim-lsp-installer"
		use "kosayoda/nvim-lightbulb"
		use "ray-x/lsp_signature.nvim"
		use "onsails/lspkind.nvim"
		use {
			"weilbith/nvim-code-action-menu",
			opt = true,
			cmd = { "CodeActionMenu" },
			config = function ()
				vim.g.code_action_menu_window_border = 'rounded'
				vim.g.code_action_menu_show_details = false
			end
		}
		use {
			"folke/trouble.nvim",
			opt = true,
			cmd = { "Trouble", "TroubleToggle" },
			config = function() require('trouble').setup() end
		}

		-- treesitter
		use "nvim-treesitter/nvim-treesitter"
		use "nvim-treesitter/nvim-treesitter-refactor"

		-- file tree
		use {
			"kyazdani42/nvim-tree.lua",
			tag = "nightly"
		}

		-- git
		use "lewis6991/gitsigns.nvim"

		-- buffers
		use "moll/vim-bbye"
		use {
			"akinsho/bufferline.nvim",
			tag = "v2.*"
		}

		-- statusline
		use "nvim-lualine/lualine.nvim"

		-- telescpope
		use "nvim-telescope/telescope.nvim"

		-- project
		use "ahmedkhalf/project.nvim"

		-- copilot
		use {
			"github/copilot.vim",
			opt = true,
			cmd = { "Copilot" }
		}

		if packer_bootstrap then
			require("packer").sync()
		end
	end
)
