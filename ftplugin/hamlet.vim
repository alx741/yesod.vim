" Vim filetype plugin file
" Language:             Haskell Yesod web framework
" Maintainer:           Daniel Campoverde <alx@rsillybytes.net>
" License:              Vim (see :h license)
" Repository:		    https://github.com/alx741/vim-yesod

let b:did_ftplugin = 1

if !exists("g:yesod_disable_maps")
    let g:yesod_disable_maps = 0
endif

if !exists("g:yesod_messages_default_lang")
    let g:yesod_messages_default_lang = "en"
endif

if !exists("g:yesod_messages_path")
    let g:yesod_messages_path = "messages"
endif


command! YesodOpenMessage execute "call hamlet#OpenMessage()"
setlocal commentstring=<!--\ %s\ -->


function! hamlet#OpenMessage()
    let s:message_word = expand("<cWORD>")
    let s:message_identifier = matchstr(s:message_word, '\C.*_{Msg\zs[a-zA-Z_-]*\ze}.*')

    if empty(s:message_identifier)
        echom "This is not a valid message identifier!"
        return ""
    endif

    let s:message_file = expand("%:p:h") . "/../" . g:yesod_messages_path .
                        \ "/" . g:yesod_messages_default_lang . ".msg"

    if filereadable(s:message_file)
        execute "edit! " . s:message_file
    else
        echom "The messages file for \"" . g:yesod_messages_default_lang .
            \ "\" does not exist!"
        return ""
    endif

    call cursor(1,1)
    let s:line_identifier = search(s:message_identifier)
    if s:line_identifier == 0
        let s:prompt = input("The message does not exist yet,
                            \ create it? [y/N]  ")

        if s:prompt ==? "y"
            execute "norm G"
            execute "put =s:message_identifier"
            execute "startinsert!"
        else
            return ""
        endif
    endif
endfunction


if exists("g:yesod_disable_maps") && g:yesod_disable_maps == 0
    nnoremap <buffer> gm :YesodOpenMessage<CR>
endif
