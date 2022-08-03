local project = require "project_nvim"

project.setup {
    detection_methods = { "pattern" },
    silent_chdir = true,
    show_hidden = true,
}
