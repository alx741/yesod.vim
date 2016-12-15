function! yesod#OpenWidgetHamlet()
    let s:root_file = expand('%:r')
    exe "edit " . s:root_file . ".hamlet"
endfunction

function! yesod#OpenWidgetJulius()
    let s:root_file = expand('%:r')
    exe "edit " . s:root_file . ".julius"
endfunction

function! yesod#OpenWidgetLucius()
    let s:root_file = expand('%:r')
    exe "edit " . s:root_file . ".lucius"
endfunction

