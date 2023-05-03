require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "cpp",
        "vim",
        "lua",
        "rust",
        "javascript",
        "typescript",
        "bash",
        "python",
        "markdown",
        "markdown_inline"
    },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100KB,
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stat and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
}