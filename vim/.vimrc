" ----------------------------------------
" Appearance and Colorscheme: Catppuccin
" ----------------------------------------

set termguicolors			" Enable true color support
colorscheme catppuccin_frappe		" Use the frappe variant (dark theme)

" Optional: Lightline support (if installed)
let g:lightline = { 'colorscheme': 'catppuccin_frappe' }

" ----------------------------------------
" Smart indentation for C development
" ----------------------------------------

filetype plugin indent on
syntax enable
set autoindent				" Copy indentation from previous line
set cindent				" Use C-style indentation
set cinoptions=:0,l1,t0,g0		" Linux style: brace on new line, minimal alignment
set noexpandtab				" Use real tab characters (not spaces)
set shiftwidth=8			" Indent by 8 columns
set softtabstop=8			" Insert/delete 8 spaces with tab/backspace
set tabstop=8				" A tab character is 8 columns wide

" ----------------------------------------
" Formatting on save with clang-format
" (requires clang-format installed)
" ----------------------------------------

let g:clang_format#style_options = {
	\ 'BasedOnStyle': 'LLVM',
	\ 'IndentWidth': 8,
	\ 'TabWidth': 8,
	\ 'UseTab': 'Always',
	\ 'BreakBeforeBraces': 'Linux',
	\ 'AllowShortIfStatementsOnASingleLine': 'false',
	\ 'AllowShortLoopsOnASingleLine': 'false',
	\ 'AllowShortFunctionsOnASingleLine': 'InlineOnly',
	\ 'ColumnLimit': 80,
	\ 'AlignConsecutiveDeclarations': 'false',
	\ 'AlignConsecutiveAssignments': 'false',
	\ 'AlignEscapedNewlines': 'Left',
	\ 'AlignOperands': 'false',
	\ 'IndentCaseLabels': 'false',
	\ 'SpaceBeforeParens': 'ControlStatements'
\ }

autocmd BufWritePre *.c,*.h call system('clang-format -i ' . shellescape(@%)) | edit!

" ----------------------------------------
" General UI settings
" ----------------------------------------

set number				" Show line numbers
set cursorline				" Highlight current line
set ruler				" Show cursor position
set wildmenu				" Enhanced command-line completion
set nowrap				" Don't wrap long lines
set mouse=a				" Enable mouse support

