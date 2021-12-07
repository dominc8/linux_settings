-------------------------------------------------------------
---        _             _             _             
---  _ __ | |_   _  __ _(_)_ __  ___  | |_   _  __ _ 
--- | '_ \| | | | |/ _` | | '_ \/ __| | | | | |/ _` |
--- | |_) | | |_| | (_| | | | | \__ \_| | |_| | (_| |
--- | .__/|_|\__,_|\__, |_|_| |_|___(_)_|\__,_|\__,_|
--- |_|            |___/                             
-------------------------------------------------------------

return require('packer').startup(function()
    use 'gruvbox-community/gruvbox'

    use 'tpope/vim-commentary'  --- gcc, gc<motion>
    use 'machakann/vim-sandwich' --- sa<motion><addition>, sd<deletion>, sr<deletion><addition>
    use 'romainl/vim-cool' --- automatic set nohlsearch

    use 'nvim-treesitter/nvim-treesitter'
    ------ use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'nvim-telescope/telescope-project.nvim'

    use 'neovim/nvim-lspconfig'
    use 'ms-jpq/coq_nvim'
    use 'ms-jpq/coq.artifacts'

    ------ use 'editorconfig/editorconfig-vim' --- setting coding std in file and make nvim adjust code to it? seems cool
    ------ use 'mhinz/vim-signify' --- showing vcs info, todo check if vim fugitive already doesn't do it and which is better

end)

