return {
  "saecki/crates.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead Cargo.toml",
  opts = {
    text = {
      loading = "  loading ",
      version = "  %s ",
      prerelease = "  %s ",
      yanked = "  %s ",
      nomatch = "  no match ",
      upgrade = "  %s ",
      error = "  error fetching crate ",
    },
  },
}
