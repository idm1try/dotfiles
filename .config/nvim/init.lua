local _impatient, impatient = pcall(require, "impatient")
if _impatient then
    impatient.enable_profile()
end

require "options"
require "plugins"
require "lsp"
require "mappings"
require "autocmds"
require "commands"
