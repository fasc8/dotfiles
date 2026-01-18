local name = vim.api.nvim_buf_get_name(0)

if name:match("/lecture_.*%.md$") or name:match("/pages/.*%.md$") then
    vim.bo.filetype = "slidev"
end
