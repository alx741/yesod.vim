" Vim filetype plugin file
" Language:             Haskell Yesod web framework
" Maintainer:           Daniel Campoverde <alx@rsillybytes.net>
" License:              Vim (see :h license)
" Repository:           https://github.com/alx741/vim-yesod

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

if !exists("g:yesod_disable_maps")
    let g:yesod_disable_maps = 0
endif

if !exists("g:yesod_handlers_directories")
    let g:yesod_handlers_directories = ['Handler']
endif


command! YesodAddHandler execute "call yesod#AddHandler()"
command! YesodOpenHandler execute "call yesod#OpenHandler()"
setlocal commentstring=--\ %s


function! yesod#OpenHandler()
    let s:route_line = getline('.')
    let s:route_resource = matchstr(s:route_line, '\C\zs[A-Z]\{1\}[a-zA-Z0-9]*\zeR ')

    if empty(s:route_resource)
        echom "There is no valid handler here!"
        return ""
    endif

    for dir in g:yesod_handlers_directories
        if finddir(expand("%:p:h") . "/../" . dir) !=? ""
            if (yesod#OpenHandlerTryDir(dir, s:route_resource))
                return ""
            endif
        else
            continue
        endif
    endfor

    let s:prompt = input("The resource handler for " .
                \ s:route_resource  .
                \ "R does not exist. Create it? [y/N]  ")

    if s:prompt ==? "y"
        call yesod#AddHandler()
        call yesod#OpenHandler()
    else
        return ""
    endif
endfunction

function! yesod#OpenHandlerTryDir(directory, route_resource)
    let s:route_resource_function = a:route_resource . "R *::"

    try
        if has("patch-7.4.1800")
            let s:use_grep = "lvimgrep"
        else
            let s:use_grep = "vimgrep"
        endif
        execute s:use_grep . " /" . s:route_resource_function . "/ " .
                    \ expand("%:p:h") . "/../" . a:directory . "/**/*"
        let success=1
    catch /*/
    finally
        if exists('success')
            return 1
        else
            return 0
        endif
    endtry
endfunction

function! yesod#AddHandler()
    let l:winview = winsaveview()

    if !executable("stack")
        echomsg "Stack executable not found in $PATH, did you installed it?"
        return
    endif

    let s:yesod_cmd = yesod#GetYesodCommand()
    if s:yesod_cmd ==? ""
        return
    endif

    silent! execute "write"
    silent! silent execute "!" . s:yesod_cmd

    if v:shell_error
        execute 'redraw!'
        echomsg "Yesod: This route is malformed or it may already exist"
        return
    else
        silent! execute "edit"
        silent! execute "normal Gdd"
        silent! execute "write"
    endif

    execute 'redraw!'
    call winrestview(l:winview)
endfunction


function! yesod#GetYesodCommand()
    let s:route_line = getline('.')

    " Match pattern and route identifier
    let s:route_pattern = matchstr(s:route_line, '\C^\/[a-zA-Z0-9#*+/.-]*')
    let s:route_resource = matchstr(s:route_line, '\C\zs[A-Z]\{1\}[a-zA-Z0-9]*\zeR ')

    if empty(s:route_pattern) || empty(s:route_resource)
        echom "There is no route here!"
        return ""
    endif


    " Match methods
    let s:route_have_get = match(s:route_line, '\CGET')
    let s:route_have_post = match(s:route_line, '\CPOST')
    let s:route_have_put = match(s:route_line, '\CPUT')
    let s:route_have_delete = match(s:route_line, '\CDELETE')

    if (s:route_have_get == -1) && (s:route_have_post == -1)
        \ && (s:route_have_put == -1) && (s:route_have_delete == -1)
        echom "There are no methods for this route!"
        return ""
    endif


    " Compose yesod command
    let s:yesod_cmd = "stack exec -- yesod add-handler -p '" . s:route_pattern . "'"
                                    \ . " -r '" . s:route_resource . "'"

    if s:route_have_get != -1
        let s:yesod_cmd = s:yesod_cmd . " -m 'GET'"
    endif
    if s:route_have_post != -1
        let s:yesod_cmd = s:yesod_cmd . " -m 'POST'"
    endif
    if s:route_have_put != -1
        let s:yesod_cmd = s:yesod_cmd . " -m 'PUT'"
    endif
    if s:route_have_delete != -1
        let s:yesod_cmd = s:yesod_cmd . " -m 'DELETE'"
    endif

    return s:yesod_cmd
endfunction


if exists("g:yesod_disable_maps") && g:yesod_disable_maps == 0
    nnoremap <buffer> gH :YesodAddHandler<CR>
    nnoremap <buffer> gh :YesodOpenHandler<CR>
endif
