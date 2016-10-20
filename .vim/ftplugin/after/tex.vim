if exists('g:loaded_surround')
    " vim-surround settings for UTF-8 quotes in LaTeX
    " use cs'q to change 'foobar' to ‘foobar’
    " use cs"Q to change "foobar" to “foobar”
    let b:surround_{char2nr('q')} = "‘\r’"
    let b:surround_{char2nr('Q')} = "“\r”"
endif
