vim.keymap.set({ "n", "v" }, "<C-b>", ":Neotree position=current toggle<CR>")

require("neo-tree").setup({
    default_component_configs = {
        created = {
            enabled = true
        },
        indent = {
            indent = 10
        },
        icon = {
            highlight = "Normal"
        },
        name = {
            trailing_slash = true
        }
    },
    window = {
        width = 100,
        position = "current"
    },
    filesystem = {
        -- hijack_netrw_behaviour = "disable"
        follow_current_file = {
            enabled = true
        },
    }
})
