set bg=dark
set autoindent
set smartindent
set cindent
set tabstop=8
set shiftwidth=8

set nu

set ruler
set title
set showmatch
set wmnu
set mouse=a
set hlsearch


"if has("autocmd")
"	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") 
"	\| exe "normal g '\"" | endif 
"endif
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l


set complete=.,w,b,u,t,i

function SetTags()
	let curdir = getcwd()

	while !filereadable("tags") && getcwd() != "/"
		cd ..
	endwhile
	
	if filereadable("tags")
		execute "set tags=" . getcwd() . "/tags"
	endif

	execute "cd " . curdir
endfunction

call SetTags()

set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db,0,match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction 
au BufEnter /* call LoadCscope()
