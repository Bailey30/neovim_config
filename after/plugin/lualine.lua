function get_current_file_location()
     -- Get the buffer number of the current buffer
    local current_buffer = vim.fn.bufnr('%')

    -- Get the file name associated with the current buffer
    local file_name = vim.fn.bufname(current_buffer)

    -- Get the full path of the file
    local full_path = vim.fn.fnamemodify(file_name, ':p')

    -- Get the project's root directory
    local project_root = vim.fn.getcwd()

    -- Make the path relative to the project root
    local relative_path = vim.fn.fnamemodify(full_path, ':~:' .. project_root)

    return relative_path
end

require('lualine').setup{
 sections = {
        lualine_c = {
            {
                get_current_file_location
            }
        }
    }
}
