setlocal foldenable
setlocal foldlevel=0
setlocal foldexpr=Fold()
setlocal foldmethod=expr

function Fold()
  let h = matchstr(getline(v:lnum), '^#\+')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

