return {
  "Olical/conjure",
  "luochen1990/rainbow",
  "guns/vim-sexp",
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    config = function()
      vim.cmd([[
        let g:sexp_mappings = {
          \ 'sexp_swap_list_backward':        '',
          \ 'sexp_swap_list_forward':         '',
          \ 'sexp_swap_element_backward':     '',
          \ 'sexp_swap_element_forward':      '',
          \ 'sexp_emit_head_element':         '',
          \ 'sexp_emit_tail_element':         '',
          \ 'sexp_capture_prev_element':      '',
          \ 'sexp_capture_next_element':      '',
          \ }
      ]])
    end,
  },
}
