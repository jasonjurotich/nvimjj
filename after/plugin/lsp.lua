local lsp = require("lsp-zero")
lsp.preset("recommended")

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.ensure_installed({
  "tsserver",
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  "emmet_ls",
  "rust_analyzer",
  "texlab",
  "jsonls",
  "marksman",
  "taplo",
  "ltex",
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.format_mapping('ty', {
  format_opts = {
    async = false,
    timeout_ms = 1000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>g,", function()
    vim.lsp.buf.formatting()
  end, opts)

  vim.keymap.set("n", "gD", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.declaration()
  end, opts)
  vim.keymap.set("n", "gi", function()
    vim.lsp.buf.implementation()
  end, opts)
  vim.keymap.set("n", "gl", function()
    vim.lsp.buf.diagnostic_open_float()
  end, opts)
  vim.keymap.set("n", "<leader>D", function()
    vim.lsp.buf.show_line_diagnostics()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>ga", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "MyNormal", { bg = "None", fg = "White" })
vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "None", fg = "#464140" })
vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#837674", fg = "White" })

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- text within current buffer
    { name = "path" },     -- file system paths
    { name = "cmp_tabnine" },
    { name = "lua-latex-symbols", option = { cache = true } },
    {
      name = "spell",
      option = {
        keep_all_entries = true,
        enable_in_context = function()
          return true
        end,
      },
    },
  }),

  mapping = cmp.mapping.preset.insert({
    ["<C-y>"] = cmp.mapping.abort(),        -- close completion window
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-i>'] = cmp.mapping.scroll_docs(4),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end),



  }),

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered({
      scrollbar = false,
      border = "rounded",
      winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      scrollbar = false,
      border = "rounded",
      winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
    }),
  },




})


require('rust-tools').setup({
  tools = {
    executor = require("rust-tools.executors").termopen,
    reload_workspace_from_cargo_toml = true,

    inlay_hints = {
      auto = true,
      only_current_line = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "-> ",
    },
  },

  server = rust_lsp,

  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  }
})
