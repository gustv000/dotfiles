call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'wojciechkepka/vim-github-dark'
Plug 'nickspoons/vim-sharpenup'
Plug 'OmniSharp/omnisharp-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'puremourning/vimspector'
Plug 'easymotion/vim-easymotion'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

syntax on
set nolist
set number
set termguicolors
set nohlsearch
set conceallevel=0
set t_Co=256
set cursorline
set cursorcolumn
set statusline+=%{gutentags#statusline()}
set encoding=utf-8
set fileencoding=utf-8
set shiftwidth=4
set autoindent
set smartindent
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set shellcmdflag=-ci
colorscheme ghdark 

let b:coc_suggest_disable = 1
let s:using_snippets = 0
let g:airline_theme='minimalist'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-cfn-lint', 'coc-phpls', 'coc-git', 'coc-eslint', 'coc-omnisharp', 'coc-pyright']
let g:indentguides_spacechar = 'â”†'
let g:indentguides_tabchar = 'â–'
let g:indentguides_ignorelist = ['json']
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "âœ¹",
    \ "Staged"    : "âœš",
    \ "Untracked" : "âœ­",
    \ "Renamed"   : "âžœ",
    \ "Unmerged"  : "â•",
    \ "Deleted"   : "âœ–",
    \ "Dirty"     : "âœ—",
    \ "Clean"     : "âœ”ï¸Ž",
    \ 'Ignored'   : 'â˜’',
    \ "Unknown"   : "?"
    \ }
let g:ranger_map_keys = 0
let g:ale_linters = { 'cs': ['OmniSharp'], 'javascript': ['eslint'] }
let g:ale_fixers = {}
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
let g:fzf_layout = { 'down': '~40%' }
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go', 'debugpy', 'debugger-for-chrome', 'netcoredbg', 'vscode-node-debug2' ]
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

map <leader>e :Ranger<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :qa<CR>
nnoremap <F1> :tabprevious<CR>
nnoremap <F2> :tabnext<CR>
nnoremap <silent> <s-Down> :m +1<CR>
nnoremap <silent> <s-Up> :m -2<CR>
vnoremap <C-c> "+y<CR>
nnoremap <C-S-f> :Ag<CR>
nnoremap <C-f> :Ag<CR>
nnoremap <C-p> :Files<CR>

" \b \f \g : go back/forward/last-used
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :b<space>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
xmap <Leader>di <Plug>VimspectorBalloonEval


" Go Debug
nnoremap <Leader>gdd :GoDebugStart<CR>
nnoremap <Leader>gdc :GoDebugContinue<CR>
nnoremap <Leader>gdt :GoDebugBreakpoint<CR>
nnoremap <Leader>gdk :GoDebugRestart<CR>
nnoremap <Leader>gdh :GoDebugStepOut<CR>
nnoremap <Leader>gdl :GoDebugStep<CR>
nnoremap <Leader>gdj :GoDebugNext<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga :CocAction<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Change to normal mode with ESC
tnoremap <Esc> <C-\><C-n>

" Define sharpenup as , to execute commands
let maplocalleader = ","
let g:sharpnup_map_prefix = ',os'

autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.ts execute ':CocCommand eslint.executeAutofix'

filetype plugin on
set omnifunc=syntaxcomplete#Complete

autocmd FileType cs setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab

" BackgroundService
" q@d => dependencias
" q@a => assinatura
" q@e => executeAsync
" q@b => backgroundService
" q@u => usings
" q@r => remove unecessary usings
" let @d = '/HostedEventeeeeevby€kdoprivate readonly pi€kr _handler;o€ku€kuoprivate readonly RabbitConfig _rabbitConfig;0€kuoprivate readonly IRabbitMessageAsync _messageAsync;'
" let @a = '/HostedEventBuseeevby/basebbbbbb€kdo_messageAsync = messageAsync;_rabbitConfig = RabbitConfigurationFactory.GetConfiguration<pi€kr>(options€kr;o_handler = handler;/based$xxxbbbdi(iIRabbitMessageAsync messageAsync,i€kr A€kb€kb€kbgg/_handlerbvey/messageAsyncei€kr, €üpi€kr handler, IOptions<MyPlatformConfiguration> options'
" let @e = '/HostedEventeeevby/RetryConfigoprotected ovv€kberride async Task ExecuteAsync(CancellationToken stoppingTokeno{await Task.Run((€kr => _messageAsync.Subscrive€kb€kbbeAsync<€üpi€kr>(_rabbitConfig, _handler$i€kr;€ku€ku€ku€kudddd'
" let @b = '/HostedEved$i BackgroundService€krx'
" let @u = 'ggi€kuusing System.Threading;ousing System.Threading.Tasks;ousing.System.Microsoft.Extensions.Hosting;0e€krxi €kr€kr€kr0e€kr€krdwxousing Microsoft.Extensions.Options;ousing PanSeguros.Platform.Abstractions.Configuration;/namespace€ku€kuousing TooSeguros.Messaging.RabbitMQ.Interfaces.v2;ousing TooSeguros.Messageing.RabbitMQ.Models;bebbbbb€kr€kr€kr€kr€kr€krx0gg'
" let @r = '/Exen€kb€kbtensions.Loggingdd/Messaggi€kb€kbing.Hostingdd/EventBusdd/EventBusdd'
let @k = '/HostedEventeeeeevby€kdoprivate readonly pi€kr _handler;o€ku€kuoprivate readonly RabbitConfig _rabbitConfig;0€kuoprivate readonly IRabbitMessageAsync _messageAsync;/HostedEventBuseeevby/basebbbbbb€kdo_messageAsync = messageAsync;_rabbitConfig = RabbitConfigurationFactory.GetConfiguration<pi€kr>(options€kr;o_handler = handler;/based$xxxbbbdi(iIRabbitMessageAsync messageAsync,i€kr A€kb€kb€kbgg/_handlerbvey/messageAsyncei€kr, €üpi€kr handler, IOptions<MyPlatformConfiguration> options/HostedEventeeevby/RetryConfigoprotected ovv€kberride async Task ExecuteAsync(CancellationToken stoppingTokeno{await Task.Run((€kr => _messageAsync.Subscrive€kb€kbbeAsync<€üpi€kr>(_rabbitConfig, _handler$i€kr;€ku€ku€ku€kudddd/HostedEved$i BackgroundService€krxggi€kuusing System.Threading;ousing System.Threading.Tasks;ousing.System.Microsoft.Extensions.Hosting;0e€krxi €kr€kr€kr0e€kr€krdwxousing Microsoft.Extensions.Options;ousing PanSeguros.Platform.Abstractions.Configuration;/namespace€ku€kuousing TooSeguros.Messaging.RabbitMQ.Interfaces.v2;ousing TooSeguros.Messageing.RabbitMQ.Models;bebbbbb€kr€kr€kr€kr€kr€krx0gg/Exen€kb€kbtensions.Loggingdd/Messaggi€kb€kbing.Hostingdd/EventBusdd/EventBusdd'

" " Handler
" " q@1 => remove disposable
" " q@c => atualiza iconsumer
" let @j = '/Disposablevnddd€kudd'
" let @c = '/Consume(dwiHandlerAsyncWithRetry$bdwbdwiIDictionary<string, object> headers0eeeeebdwiMessageHandlerResult:%s/ConsumerResult/MessageHaa€kbndlerResult/g/IConsumer/ICONS€kb€kb€kbonsumer<dwiIEventHandlerAsync/IConsumerdd'
" let @o = 'gg/namespace€ku€kuousing TooSeguros.Messageing.RabbitMQ.Interfaces.v2;ousing TooSeguros.Message€kbing.RabbitMQ.Enumsl€kb;€kubbbbbe€kl€kl€klx€kdousing System.Collections.Generic;/Abd€kbstractions.Consumerdd'
let @l = '/Disposablevnddd€kudd/Consume(dwiHandlerAsyncWithRetry$bdwbdwiIDictionary<string, object> headers0eeeeebdwiMessageHandlerResult:%s/ConsumerResult/MessageHaa€kbndlerResult/g/IConsumer/ICONS€kb€kb€kbonsumer<dwiIEventHandlerAsync/IConsumerddgg/namespace€ku€kuousing TooSeguros.Messageing.RabbitMQ.Interfaces.v2;ousing TooSeguros.Message€kbing.RabbitMQ.Enumsl€kb;€kubbbbbe€kl€kl€klx€kdousing System.Collections.Generic;/Abd€kbstractions.Consumerdd'

let @w = '0V:s/"/\\"/g0e€klxe€krxeebx$€kl€klx0'
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ts setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=8 tabstop=8 expandtab

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = {
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_next_item()
	  elseif vim.fn["vsnip#available"](1) == 1 then
	    feedkey("<Plug>(vsnip-expand-or-jump)", "")
	  else
	    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	  end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function()
	  if cmp.visible() then
	    cmp.select_prev_item()
	  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
	    feedkey("<Plug>(vsnip-jump-prev)", "")
	  end
	end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline', keyword_pattern = [[\!\@<!\w*]] }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

  require('lspconfig')['omnisharp'].setup {
    cmd = { "/home/gustavo/.config/coc/extensions/coc-omnisharp-data/server/run" },
  }
EOF

