return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = function()
            require("mini.ai").setup()
        end
    },
}
