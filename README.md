# dotfiles

Dotfiles to ease the pain of setting up my systems

Includes config files for:

 - Jonaburg's fork of [Picom](https://github.com/jonaburg/picom)

 - Neovim using [vim-plug](https://github.com/junegunn/vim-plug) (needs npm)

 - [Kitty](https://sw.kovidgoyal.net/kitty/)

 - [Awesomewm](https://awesomewm.org/) 4.3

And a series of [personal scripts](https://github.com/zhesnaile/dotfiles/tree/main/.local/bin/userscripts).

## Copydotfiles.lua
As the name implies, it's a lua script that will copy the dotfiles of the programs you select.
To run it just use:

`chmod +x copydotfiles.lua && ./copydotfiles.lua`

If you want to select only specific dotfiles, modify the `config_list` variable at the beginning of the script using comments.

For example, the following code will only copy my set of scripts, as well as awesome and neovim's configuration files.
```lua
local config_list = {
  "awesome",
--  "kitty",
  "nvim",
--  "picom",
--  "shells",
  "scripts",
}
````
There is also a `grab_fonts` variable, set it to `1` for it to download and install [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

