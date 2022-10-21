![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)


从[amix/vimrc](https://github.com/amix/vimrc) 中分离出来了。
我删除了不少老的插件，和我用不上或不会用的插件。


# TODO

- 获取子模块的插件命令: `git submodule update --init --recursive`

# <leader>

本来用的`leader` 是`,` ， 看了这个
[vim-init issue22](https://github.com/skywind3000/vim-init/issues/22)
后换成了`<Space>` 。不过`,` 确实比`<Space>` 要舒服一点，而且官方文档在介绍`mapleader` 
的时候用的例子也是`,` 。

[leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader)

## 依赖

- `Universal Ctags`，插件`tagbar` 和`vim-gutentags` 需要
- `YouCompleteMe` 的各种依赖[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#installation)


## Key Mappings

###  Normal Mode

隐藏高亮的搜索结果:
	
	map <silent> <leader><cr> :noh<cr>

窗口跳转:
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>

switch between tab:

    noremap <silent><leader>1 1gt<cr>
    noremap <silent><leader>2 2gt<cr>
    noremap <silent><leader>3 3gt<cr>
    noremap <silent><leader>4 4gt<cr>
    noremap <silent><leader>5 5gt<cr>
    noremap <silent><leader>6 6gt<cr>
    noremap <silent><leader>7 7gt<cr>
    noremap <silent><leader>8 8gt<cr>
    noremap <silent><leader>9 9gt<cr>
    noremap <silent><leader>0 10gt<cr>

### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a`<esc>`<i`<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Plugin related mappings

[LeaderF](https://github.com/Yggdroot/LeaderF) to find file fastly:

    let g:Lf_ShortcutF = "<leader>ff"
    noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
    noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

[asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) to run Shell Command async:

    nnoremap <leader>r :AsyncRun 

[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) to complete code and `GOTO`:

    nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
    nmap <leader>fd <Plug>(YCMFindSymbolInDocument)
    nnoremap <leader>jd :YcmCompleter GoTo<CR>
    nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
    nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
    nnoremap <leader>jd :YcmCompleter GoTo<CR>
    nnoremap <leader>jcr :YcmCompleter GoToCallers<CR>
    nnoremap <leader>jce :YcmCompleter GoToCallees<CR>
    nnoremap <leader>kd :YcmCompleter GetDoc<CR>

[tagbar](https://github.com/preservim/tagbar) to toggle tag list:

    nmap <F8> :TagbarToggle<CR>

[NERD Tree](https://github.com/preservim/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack) mappings to manage the kill-ring (clipboard):

    nmap <C-p> <Plug>yankstack_substitute_older_paste
    nmap <C-n> <Plug>yankstack_substitute_newer_paste

[vim-snipmate](https://github.com/garbas/vim-snipmate) mappings to autocomplete via snippets:

    ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
    snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

[vim-surround](https://github.com/tpope/vim-surround) mappings to easily surround a string with `_()` gettext annotation:

    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error:

    nmap <silent> <leader>a <Plug>(ale_next_wrap)

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) the default mapping to toggle the plugin is (`<leader>ig`)

    You can also use the following commands inside Vim:
    :IndentGuidesEnable
    :IndentGuidesDisable
    :IndentGuidesToggle

[vim-fugitive](https://github.com/tpope/vim-fugitive) to copy the link to the line of a Git repository to the clipboard:

    nnoremap <leader>v :.GBrowse!<CR>
    xnoremap <leader>v :'<'>GBrowse!<CR>

### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

### Running Code
To run code directly from vim, press `F5`. The currently open code will execute without you having to type anything.

Can be used to execute code written in C, C++, Java, Python, Go, Octave, Bash scripts and HTML. To edit how you want your code to be executed, make changes in the file 
```
~/.vim_runtime/vimrcs/extended.vim
```

### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

