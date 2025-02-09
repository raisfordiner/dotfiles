return {
    {
        "ggandor/leap.nvim",
        dependencies = {},
        config = function()
            require("leap").add_default_mappings()
            local opts = require("leap").opts
            opts.safe_labels = {}
        end
    },
}
