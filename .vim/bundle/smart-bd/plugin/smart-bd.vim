function! Bd()
  let current_buffer = bufnr('%')
  bnext
  exec "bdelete ".current_buffer
endfunction

command Bd call Bd()
