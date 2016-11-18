# Vim - Yesod

Vim plugin for the Haskell [Yesod web framework](http://www.yesodweb.com/).

* Syntax for `config/models` and `config/routes`
* Create new handlers for routes under the cursor while in `config/routes`

*Note:* This plugin *does not* add syntax for *shakesperean templates*, there is
another plugin that does:
[vim-syntax-shakespeare](https://github.com/pbrisbin/vim-syntax-shakespeare).


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

### Adding new handlers

While editing `config/routes` you can use the predefined `gH` map to
automatically create a new handler module for the route under the cursor; it
will also add it to the *cabal* and *Application.hs* files as well.

Or you can directly use the `:YesodAddHandler` command while on top of the
desired route.


## Configuration

You can disable the predefined `gH` map with:

    let g:yesod_disable_map = 1

And then add your own like:

    nnoremap <leader>H :YesodAddHandler<CR>


### Screenshots

`config/models` and `config/routes` files:

![Screenshot](screenshot.png)
