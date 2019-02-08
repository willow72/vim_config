set bg=dark
set autoindent
set cindent
set tabstop=8
set shiftwidth=8

set nu

set ruler
set title
set showmatch
set wmnu
set mouse=a


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



function SetTags()
	let curdir = getcwd()

	while !filereadable("tags") && getcwd() != "/"
		cd ..
	endwhile
	
	if filereadable("tags")
		execute "set tags=" . get cwd() . "/tags"
	endif

	execute "cd " . curdir
endfunction

call SetTags()


