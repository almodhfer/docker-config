lua << EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<Leader>j]],
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
--  shade_terminals = true,
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = false,
  insert_mappings =false, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float', --| 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = 'bash', -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.u
    border =  'curved', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    --winblend = 1,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
 
EOF
nnoremap <Leader>k :ToggleTermToggleAll<CR>
tnoremap <Leader>k :ToggleTermToggleAll<CR>
