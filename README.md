# Vim - Yesod

Vim plugin for the Haskell [Yesod web framework](http://www.yesodweb.com/).

![Yesod](yesod_logo.png)


* Syntax for `config/models`
* Syntax for `config/routes`
* Syntax for i18n `messages`
* Jump to handler files from declared routes
* Create new handlers for routes under the cursor while in `config/routes`

**Note:** This plugin *does not* add syntax for *shakesperean templates*, there is
another plugin that does:
[vim-syntax-shakespeare](https://github.com/pbrisbin/vim-syntax-shakespeare).


## Installation

Compatible with `Vundle`, `Pathogen`, `Vim-plug`.


## Usage

*vim-yesod* gives you some predefined mappings.

For the `config/routes` file:

Map | Command | Action
--- | ------- | ------
**gh** | :YesodOpenHandler | Jump to the handler of the route under the cursor
**gH** | :YesodAddHandler | Create a new handler for the route under the cursor


## Configuration

### Mappings

You can disable the predefined `gH` and `gh` mappings with:

    let g:yesod_disable_maps = 1

And then add your own like:

    nnoremap <leader>H :YesodAddHandler<CR>
    nnoremap <leader>h :YesodOpenHandler<CR>

### Handlers location

The Yesod default location for handlers is `Handler` in the project root. If you
keep your handlers in a different location, lets say for instance:
`src/Handler`, you can configure it like:

    let g:yesod_handlers_path = "src/Handler"


### Screenshots

`config/models` and `config/routes` files:

![Screenshot](screenshot.png)
