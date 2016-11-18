" Vim filetype plugin file
" Language:             Haskell Yesod web framework
" Maintainer:           Daniel Campoverde <alx@rsillybytes.net>
" License:              Vim (see :h license)
" Repository:		    https://github.com/alx741/vim-yesod

if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

if !exists("g:yesod_disable_map")
    let g:yesod_disable_map = 0
endif

setlocal commentstring=--\ %s

function! yesod#GetYesodCommand()
    let s:route_line = getline('.')

    " Match pattern and route identifier
    let s:route_pattern = matchstr(s:route_line, '^\/[a-zA-Z./]*')
    let s:route_route = matchstr(s:route_line, '\v\zs[A-Z]+[a-zA-Z]\zeR')

    if empty(s:route_pattern) || empty(s:route_route)
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
    let s:yesod_cmd = "yesod add-handler -p '" . s:route_pattern . "'"
                                    \ . " -r '" . s:route_route . "'"

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


function! YesodAddHandler()
    let l:winview = winsaveview()

    if !executable("yesod")
        echomsg "Yesod executable not found in $PATH, did you installed it?
                    \ (stack install yesod-bin)"
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
        echomsg "Yesod: This route may already exist"
        return
    else
        silent! execute "edit"
        silent! execute "normal Gdd"
        silent! execute "write"
    endif

    execute 'redraw!'
    call winrestview(l:winview)
endfunction

if exists("g:yesod_disable_map") && g:yesod_disable_map == 0
    nnoremap gh :call YesodAddHandler()<CR>
endif
