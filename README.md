# Vim - Yesod

Vim plugin for the Haskell [Yesod web framework](http://www.yesodweb.com/).

![Yesod](yesod_logo.png)


* Syntax for `config/models` and `config/routes`
* Jump to handler files from declared routes
* Create new handlers for routes under the cursor while in `config/routes`

*Note:* This plugin *does not* add syntax for *shakesperean templates*, there is
another plugin that does:
[vim-syntax-shakespeare](https://github.com/pbrisbin/vim-syntax-shakespeare).


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

### Jumping to handlers

While editing `config/routes` you can use the predefined `gh` map to
jump to the handler file of the corresponding resource.

Or you can directly use the `:YesodOpenHandler` command while on top of the
desired route line.

### Adding new handlers

While editing `config/routes` you can use the predefined `gH` map to
automatically create a new handler module for the route under the cursor; it
will also add it to the *cabal* and *Application.hs* files as well.

Or you can directly use the `:YesodAddHandler` command while on top of the
desired route line.


## Configuration

You can disable the predefined `gH` and `gh` mappings with:

    let g:yesod_disable_maps = 1

And then add your own like:

    nnoremap <leader>H :YesodAddHandler<CR>
    nnoremap <leader>h :YesodOpenHandler<CR>


### Screenshots

`config/models` and `config/routes` files:

![Screenshot](screenshot.png)
