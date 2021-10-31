

-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

core.log("diretorio ativo" .. core.project_dir)

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.dracula")

--------------------------- Key bindings -------------------------------------

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }


------------------------------- Fonts ----------------------------------------

-- after install fontconfig
local fontconfig = require "plugins.fontconfig"
fontconfig.use {
  code_font = { name = "JetBrainsMono", size = 13 * SCALE }
}

-- customize fonts:
-- style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 14 * SCALE)
-- style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full"}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full

------------------------------ Plugins ----------------------------------------

-- enable or disable plugin loading setting config entries:

-- enable plugins.trimwhitespace, otherwise it is disable by default:
-- config.plugins.trimwhitespace = true
--
-- disable detectindent, otherwise it is enabled by default
-- config.plugins.detectindent = false

-- lsp
local lspconfig = require "plugins.lsp.config"

lspconfig.intelephense.setup {
  init_options = {
    storagePath = "/home/andremeireles/.config/intelephense"
  }
}

lspconfig.sumneko_lua.setup {
  command = {
    "/home/andremeireles/Downloads/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    "/home/andremeireles/Downloads/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = false
      }
    }
  }
}

-- console
require "plugins.console"

-- gitdiff
local gitdiff = require "gitdiff"

 -- diff is the output of the `git diff` command
 -- this only works on single-file diffs
gitdiff.changed_lines(diff)
-- returns a table that looks like the following:
{
	nil,
	nil,
	"addition",
	"addition",
	nil,
	nil,
	"modification",
	"deletion",
	nil,
	nil
}

local lintplus = require "plugins.lintplus"
lintplus.setup.lint_on_doc_load()
lintplus.setup.lint_on_doc_save()

