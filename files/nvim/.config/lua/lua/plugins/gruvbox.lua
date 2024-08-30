return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_background = 'hard'                 -- 'hard', 'medium', 'soft'
    vim.g.gruvbox_material_foreground = 'original'             -- 'material', 'mix', 'original'
    vim.g.gruvbox_material_ui_contrast = 'high'                -- 'low', 'high'
    vim.g.gruvbox_material_sign_column_background = 'grey'     -- 'grey', 'none'

    vim.g.gruvbox_material_statusline_style = 'original'

    vim.g.gruvbox_material_better_performance = 1

    vim.cmd.colorscheme('gruvbox-material')
  end
}
