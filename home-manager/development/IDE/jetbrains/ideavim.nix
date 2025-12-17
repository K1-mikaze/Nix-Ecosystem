{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.jetbrains.ideavim.enable = lib.mkEnableOption "Enables IdeaVim configuration ";

  config = lib.mkIf config.development.IDE.jetbrains.ideavim.enable {
    home.file.".ideavimrc" = {
      text = ''
        Plug 'tpope/vim-commentary'
        set clipboard+=unnamedplus
        let mapleader = " "
        set which-key
        set visualbell
        set noerrorbells
        set number relativenumber

        nnoremap <C-w> :action HideActiveWindow<CR>
        nnoremap <leader>fa :action FindInPath<CR>
        nnoremap <leader>ff :action GotoFile<CR>
        nnoremap <leader>fh :action GotoAction<CR>

        nnoremap <C-Tab> :action NextTab<CR>
        nnoremap <C-S-Tab> :action PreviousTab<CR>
        nnoremap <C-w> :action CloseContent<CR>

        nnoremap <C-s> :action SaveAll<CR>

        nnoremap <leader>cr :action FindUsages<CR>
        nnoremap <leader>ca :action ShowIntentionActions<CR>
        nnoremap <leader>ce :action GotoError<CR>
        nnoremap <leader>cs :action ShowErrorDescription<CR>
        nnoremap <leader>cd :action GotoDeclaration<CR>
        nnoremap <leader>ci :action GotoImplementation<CR>

        nnoremap <leader>cf :action GotoSymbol<CR>

        nnoremap <leader>fi :action Find<CR>

        nnoremap <leader>cq :action GotoNextError<CR>

        nnoremap <leader><Tab> :action RecentFiles<CR>
        inoremap <C-p> <C-P>
        inoremap <C-n> <C-N>
      '';
    };
  };
}
