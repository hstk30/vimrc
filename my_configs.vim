
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim, 直接使用系统快捷键
" nmap <leader>p "+p

" => bufferhint plugin
nnoremap - :call bufferhint#Popup()<cr>
nnoremap \ :call bufferhint#LoadPrevious()<cr>

" => tagbar plugin
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'

" => universal ctags  https://github.com/universal-ctags/ctags
" https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html
" my ctags options: ~/.ctags.d/common.ctags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
set tags=./.tags;,.tags

" => vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" let g:gutentags_exclude_filetypes = ['.pyc', '.dll', '.log']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += [
            \ '--exclude=.git', '--exclude=BUILD', '--exclude=.svn', 
            \ '--exclude=*.js', '--exclude=vendor/*', '--exclude=node_modules/*', 
            \ '--exclude=db/*', '--exclude=log/*', '--exclude=\*.min.\*', 
            \ '--exclude=\*.swp', '--exclude=\*.bak', '--exclude=\*.pyc', 
            \ '--exclude=\*.class', '--exclude=\*.sln', '--exclude=\*.csproj', 
            \ '--exclude=\*.csproj.user', '--exclude=\*.cache', '--exclude=\*.dll', 
            \ '--exclude=\*.pdb', '--exclude=target', '--exclude=.idea', 
            \ '--exclude=\*.md', '--exclude=\*.markdown', '--exclude=doc/*', 
            \ '--exclude=docs/*', '--exclude=bin/*', '--exclude=ide/*'
            \ ]

" Jump back up in the tag stack
nmap g[ <c-t> 

" => LeaderF
" don't show the help in normal mode
set modelines=1
let g:Lf_ShowDevIcons = 0
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" 排除搜索的文件夹和文件
let g:Lf_WildIgnore = {
       \ 'dir': ['.svn','.git','.hg','venv','.vscode','.SpaceVim.d', 'target', 'log', 'vendor'],
       \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
       \}


" => cscope
let g:cscope_silent = 1
" nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


