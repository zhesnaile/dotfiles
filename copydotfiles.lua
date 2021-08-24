#!/usr/bin/env lua

-----------------------------------------------------------------------
-- SETTINGS
-----------------------------------------------------------------------

-- list of programs to copy the config from.
-- comment or uncomment the ones you need.
local config_list = {
  "awesome",
  "kitty",
  "nvim",
  "picom",
  "shells",
--  "scripts",
--  "fonts",
}

-- might add separate variables for fonts and scripts and remove them from the config list.


-----------------------------------------------------------------------
-- SCRIPT BEGINS HERE
-----------------------------------------------------------------------

local home =  os.getenv("HOME")
local backup_dir = home .. "/.backup"

local locations = {
  ["awesome"] = ".config/awesome",
  ["kitty"] = ".config/kitty",
  ["nvim"] = ".config/nvim",
  ["picom"] = ".config/picom",
  ["shells"] = ".config/shells",
  ["scripts"] = ".local/bin/userscripts",
  ["fonts"] = ".local/share/fonts",
}

--[[
TODO: modify the following loop to copy files using those paths.
IMPORTANT: ADD CHECKS FOR FONTS AND SCRIPTS
--]]

-- for x, y in pairs(config_list) do print(locations[y]) end



---[[
-- Deletes $HOME/.backup and generates a new one
local function generate_backup_dir()
  os.execute("rm -rf " .. backup_dir)
  os.execute("mkdir -p " .. backup_dir .. "/.local " .. backup_dir .. "/.config" )
end

-- Copies existing files to the backup directory
local function make_backup()
    os.execute("cp -rv " .. backup_dir .. "")
end


-- Copies dotfiles from this directory to their appropriate place in $HOME
local function copy_dotfiles()
  os.getenv()
end

-- Calls three previous functions.
local function start_process()
  generate_backup_dir()
  make_backup()
  copy_dotfiles()
end


-- If no "-y" flag has been specified, show this warning to prevent unwanted results.
local function preemptive_warning()
  io.write("Warning: your files will be moved to $HOME/.backup.\n\nIf $HOME/.backup already exists it will be deleted first.\n\nWrite YES in capital letters to continue:\n")
  local confirmation = io.read("*line")
  if confirmation == "YES" then
    io.write("\ncreating $HOME/.backup and moving files.\n(Use -y flag to skip this warning next time).\n")
    start_process()
  else
    io.write("No changes were made.\n")
  end
end


-- Start of the script, checks for "-y" flag, shows a warning if not found.
if arg[1] == "-y"
  then start_process()
else preemptive_warning()
end
--]]
