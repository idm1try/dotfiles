local devicons = require "nvim-web-devicons"
local colors = require("colorscheme").colors

devicons.setup {
    override = {
        html = {
            icon = "",
            color = colors.orange,
            name = "html",
        },
        css = {
            icon = "",
            color = colors.blue,
            name = "css",
        },
        scss = {
            icon = "",
            color = colors.magenta,
            name = "scss",
        },
        sass = {
            icon = "",
            color = colors.magenta,
            name = "sass",
        },
        js = {
            icon = "",
            color = colors.yellow,
            name = "js",
        },
        ts = {
            icon = "ﯤ",
            color = colors.blue,
            name = "ts",
        },
        kt = {
            icon = "𝙆",
            color = colors.orange,
            name = "kt",
        },
        png = {
            icon = "",
            color = colors.magenta,
            name = "png",
        },
        jpg = {
            icon = "",
            color = colors.cyan,
            name = "jpg",
        },
        jpeg = {
            icon = "",
            color = colors.cyan,
            name = "jpeg",
        },
        mp3 = {
            icon = "",
            color = colors.green,
            name = "mp3",
        },
        mp4 = {
            icon = "",
            color = colors.green,
            name = "mp4",
        },
        out = {
            icon = "",
            color = colors.blue,
            name = "out",
        },
        rb = {
            icon = "",
            color = colors.red,
            name = "rb",
        },
        vue = {
            icon = "﵂",
            color = colors.green,
            name = "vue",
        },
        py = {
            icon = "",
            color = colors.orange,
            name = "py",
        },
        toml = {
            icon = "",
            color = colors.blue,
            name = "toml",
        },
        lock = {
            icon = "",
            color = colors.red,
            name = "lock",
        },
        zip = {
            icon = "",
            color = colors.cyan,
            name = "zip",
        },
        xz = {
            icon = "",
            color = colors.cyan,
            name = "xz",
        },
        deb = {
            icon = "",
            color = colors.red,
            name = "deb",
        },
        rpm = {
            icon = "",
            color = colors.red,
            name = "rpm",
        },
        lua = {
            icon = "",
            color = colors.blue,
            name = "lua",
        },
        txt = {
            icon = "",
            color = colors.blue,
            name = "txt",
        },
        md = {
            icon = "",
            color = colors.magenta,
            name = "markdown",
        },
        ["markdown"] = {
            icon = "",
            color = colors.magenta,
            name = "markdown",
        },
        graphql = {
            icon = "",
            color = colors.magenta,
            name = "graphql",
        },
        env = {
            icon = "",
            color = colors.yellow,
            name = "dotenvexample",
        },
        [".env.production"] = {
            icon = "",
            color = colors.yellow,
            name = "envprod",
        },
        [".env.development"] = {
            icon = "",
            color = colors.yellow,
            name = "envdev",
        },
        [".env.testing"] = {
            icon = "",
            color = colors.yellow,
            name = "envtest",
        },
        [".env.example"] = {
            icon = "",
            color = colors.yellow,
            name = "dotenvexample",
        },
        [".env"] = {
            icon = "",
            color = colors.yellow,
            name = "dotenv",
        },
        ["docker-compose.yml"] = {
            icon = "",
            color = colors.cyan,
            name = "dockercompose",
        },
        [".dockerignore"] = {
            icon = "",
            color = colors.orange,
            name = "dockerignore",
        },
        [".prettierignore"] = {
            icon = "",
            color = colors.orange,
            name = "prettierignore",
        },
        [".prettierrc"] = {
            icon = "",
            color = colors.cyan,
            name = "prettier",
        },
        [".prettierrc.json"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierjson",
        },
        [".prettierrc.js"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierrcjs",
        },
        ["prettier.config.js"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierjsconfig",
        },
        [".prettier.yaml"] = {
            icon = "",
            color = colors.cyan,
            name = "prettieryaml",
        },
        ["test.js"] = {
            icon = "",
            color = colors.yellow,
            name = "javascripttest",
        },
        ["test.jsx"] = {
            icon = "",
            color = colors.yellow,
            name = "reactrest",
        },
        ["test.ts"] = {
            icon = "",
            color = colors.blue,
            name = "typescripttest",
        },
        ["test.tsx"] = {
            icon = "",
            color = colors.blue,
            name = "reacttypescripttest",
        },
        ["spec.js"] = {
            icon = "",
            color = colors.yellow,
            name = "javascriptspectest",
        },
        ["spec.jsx"] = {
            icon = "",
            color = colors.yellow,
            name = "reactspectest",
        },
        ["spec.ts"] = {
            icon = "",
            color = colors.blue,
            name = "typescriptspectest",
        },
        ["spec.tsx"] = {
            icon = "",
            color = colors.blue,
            name = "reacttypescriptspectest",
        },
        ["yarn-error.log"] = {
            icon = "",
            color = colors.red,
            name = "yarnerrorlog",
        },
        ["yarn.lock"] = {
            icon = "",
            color = colors.blue,
            name = "yarnlock",
        },
        ["pnpm-lock.yaml"] = {
            icon = "",
            color = colors.orange,
            name = "pnpmlock",
        },
        ["package.json"] = {
            icon = "",
            color = colors.green,
            name = "npm_packagejson",
        },
        ["package-lock.json"] = {
            icon = "",
            color = colors.red,
            name = "packagelockjson",
        },
        [".gitignore"] = {
            icon = "",
            color = colors.orange,
            name = "gitignore",
        },
        [".gitattributes"] = {
            icon = "",
            color = colors.orange,
            name = "gitattributes",
        },
        ["Dockerfile"] = {
            icon = "",
            color = colors.blue,
            name = "dockerfilex",
        },
        [".nvmrc"] = {
            icon = "",
            color = colors.green,
            name = "nvmrc",
        },
        [".eslintrc.js"] = {
            icon = "ﯶ",
            color = colors.magenta,
            name = "eslintrcjs",
        },
        [".travis.yml"] = {
            icon = "",
            color = colors.red,
            name = "travis",
        },
        [".babelrc"] = {
            icon = "",
            color = colors.yellow,
            name = "babelrc",
        },
        ["babel.config.js"] = {
            icon = "",
            color = colors.yellow,
            name = "babelconfig",
        },
        [".commitlintrc.json"] = {
            icon = "ﰚ",
            color = colors.green,
            name = "commitlinrcjson",
        },
        ["commitlint.config.ts"] = {
            icon = "ﰚ",
            color = colors.green,
            name = "commitlintconfigts",
        },
        ["Makefile"] = {
            icon = "",
            color = colors.yellow,
            name = "makefile",
        },
        ["tsconfig.build.json"] = {
            icon = "",
            color = colors.blue,
            name = "tsconfigbuildjson",
        },
        ["tsconfig.json"] = {
            icon = "",
            color = colors.blue,
            name = "tsconfigjson",
        },
        ["nest-cli.json"] = {
            icon = "",
            color = colors.red,
            name = "nestclijson",
        },
        ["vite.config.js"] = {
            icon = "",
            color = colors.yellow,
            name = "viteconfigjs",
        },
        ["vite.config.ts"] = {
            icon = "",
            color = colors.blue,
            name = "viteconfigts",
        },
        ["Procfile"] = {
            icon = "",
            color = colors.magenta,
            name = "procfile",
        },
        [".editorconfig"] = {
            icon = "",
            color = colors.bg0,
            name = "editorconfig",
        },
        ["LICENSE"] = {
            icon = "",
            color = colors.blue,
            name = "LICENSE",
        },
        snap = {
            icon = "",
            color = colors.fg,
            name = "snap",
        },
    },
    default = true,
}
