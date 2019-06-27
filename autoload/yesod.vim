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

function! yesod#OpenWidgetCassius()
    let s:root_file = expand('%:r')
    exe "edit " . s:root_file . ".cassius"
endfunction

function! yesod#Touch()
    exe "silent ! stack exec -- yesod touch"
    exe "silent ! if [[ -f Settings.hs ]]; then touch Settings.hs; fi"
    exe "redraw!"
endfunction

function! yesod#openModels()
    exe "edit config/models*"
endfunction

function! yesod#openRoutes()
    exe "edit config/routes"
endfunction
