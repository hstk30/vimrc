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

[mapleader](https://vimdoc.sourceforge.net/htmldoc/map.html#mapleader)

## 依赖

- `Universal Ctags`，插件`tagbar` 和`vim-gutentags` 需要
- `YouCompleteMe` 的各种依赖[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#installation)


## Key Mappings

###  Normal Mode

隐藏高亮的搜索结果:
	
	map <silent> <leader>/ :noh<cr>

窗口跳转:
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

`tab` 管理:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

`tab` 切换:

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

`ack.vim` 类似`grep` :
	
	map <leader>g :Ack 

粘贴模式开关，防止从其他地方复制来的东西格式混乱:
	
	map <leader>pp :setlocal paste!<cr>

### Visual mode 

对选中的内容进行`ack`:

    vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

对选中内容进行全局替换:

    vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

### Insert mode

当前时间的缩写，快捷输入当前时间:

    iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings


类似`Bash` 上的快捷键:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

### Plugin related mappings

文件查找、切换 [LeaderF](https://github.com/Yggdroot/LeaderF) :

    let g:Lf_ShortcutF = "<leader>ff"
    noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
    noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

异步跑命令行[asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) :

    nnoremap <leader>ar :AsyncRun 

代码补全、`GOTO` 功能[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) :

    nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
    nmap <leader>fd <Plug>(YCMFindSymbolInDocument)
    nnoremap <leader>jd :YcmCompleter GoTo<CR>
    nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
    nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
    nnoremap <leader>jd :YcmCompleter GoTo<CR>
    nnoremap <leader>jcr :YcmCompleter GoToCallers<CR>
    nnoremap <leader>jce :YcmCompleter GoToCallees<CR>
    nnoremap <leader>kd :YcmCompleter GetDoc<CR>

查看文件的`tag` 列表[tagbar](https://github.com/preservim/tagbar) :

    nmap <F8> :TagbarToggle<CR>

项目文件树 [NERD Tree](https://github.com/preservim/nerdtree) :

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

括号、引号等的删除替换 [vim-surround](https://github.com/tpope/vim-surround)


[vim-snipmate](https://github.com/garbas/vim-snipmate) 和 [vim-snippets](https://github.com/honza/vim-snippets)
片段补全，`keyword<C-j>` 就完事了:

    ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
    snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

代码动态检查[ale](https://github.com/dense-analysis/ale) :

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

