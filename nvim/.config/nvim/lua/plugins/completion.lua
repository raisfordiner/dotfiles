return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' },
    },
    completion = {
        list = {
            selection = { preselect = false, auto_insert = false }
        },
        menu = { border = 'rounded' },
        documentation = {
            auto_show = true,
            window = { border = 'rounded' },
        }
    },
    signature = {
        enabled = false,
        window = { border = 'rounded' },
    },
  },
  opts_extend = { "sources.default" }
}
