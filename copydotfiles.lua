#!/usr/bin/env lua
-- vim:fdm=marker
-----------------------------------------------------------------------
-- SETTINGS {{{
-----------------------------------------------------------------------

-- list of programs to copy the config from.
-- comment or uncomment the ones you need.
-- PLEASE DO NOT ADD "fonts" AS THIS ISN'T HANDLED PROPERLY AND THE SCRIPT MIGHT DELETED YOUR ALREADY INSTALLED FONTS IF YOU DO SO.
-- USE THE "grab_fonts" VARIABLE INSTEAD.
local config_list = {
  "awesome",
  "kitty",
  "nvim",
  "picom",
  "rofi",
  "shells",
  "scripts",
}

-- Set to 1 to grab and unpack Fira Code NF in $HOME/.local/share/fonts
-- relies on wget and unzip
local grab_fonts = 0;

-- }}}

-----------------------------------------------------------------------
-- SCRIPT BEGINS HERE {{{
-----------------------------------------------------------------------

-- some vars {{{
local home = os.getenv("HOME")
local backup_dir = home .. "/.backup"

local locations = {
  ["awesome"] = ".config/awesome",
  ["kitty"] = ".config/kitty",
  ["nvim"] = ".config/nvim",
  ["picom"] = ".config/picom",
  ["rofi"] = ".config/rofi",
  ["shells"] = ".config/shells",
  ["scripts"] = ".local/bin/userscripts",
  ["fonts"] = ".local/share/fonts",
}

--}}}


-- helper functions {{{

-- Moves Existing Dotfiles to $HOME/.backup
local function make_backup()

  -- Delete and create empty $HOME/.backup
  os.execute("rm -rf " .. backup_dir)
  os.execute("mkdir -p " .. backup_dir .. "/.local " .. backup_dir .. "/.config" )

  -- Moves existing dotfiles to $HOME/.backup
  for x, y in pairs(config_list)
    do
      -- ignores userscripts
      if y ~= "scripts" then
        os.execute("mv " .. home .. "/" .. locations[y]
                    .. " " .. backup_dir .. "/" .. locations[y])
      end

  end
end


-- Copies dotfiles from this directory to their appropriate place in $HOME
local function copy_dotfiles()
  for x, y in pairs(config_list)
    do
      os.execute("mkdir -p " .. home .. "/" .. locations[y])
      os.execute("cp -rv " .. locations[y] .. "/* "
                  .. home .. "/" .. locations[y])
  end
end


-- Downloads and unpacks FiraCode NerdFont
local function dl_font()
  os.execute("wget "
            .. "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
            .. "; unzip FiraCode.zip -d "
            .. home .. "/" .. locations["fonts"])
end

-- Calls three previous functions.
local function start_process()
  make_backup()
  copy_dotfiles()

  -- check if font was requested
  if grab_fonts == 1
    then dl_font()
  end

end


-- If no "-y" flag has been specified, show this warning to prevent unwanted results.
local function preemptive_warning()

  io.write("Warning: your files will be moved to $HOME/.backup.\n\n"
          .. "If $HOME/.backup already exists it will be deleted first.\n\n"
          .. "Write YES in capital letters to continue:\n")

  local confirmation = io.read("*line")

  if confirmation == "YES" then
    io.write("\ncreating $HOME/.backup and moving files.\n"
            .."(Use -y flag to skip this warning next time).\n")
    start_process()
  else
    io.write("No changes were made.\n")
  end

end
--}}}

-- Start of the script, checks for "-y" flag, shows a warning if not found.
if arg[1] == "-y" then
  start_process()
else
  preemptive_warning()
end
