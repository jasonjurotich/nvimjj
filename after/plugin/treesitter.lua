require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  rainbow = { 
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = { enable = false, disable = { "rust" } },
  autotag = { enable = true },
  ensure_installed = {
    "json", "javascript",
    "typescript", "tsx", "yaml",
    "html", "css", "markdown",
    "svelte", "graphql", "bash",
    "lua", "vim", "dockerfile",
    "gitignore", "rust", "latex",
  },
  auto_install = true,
})

