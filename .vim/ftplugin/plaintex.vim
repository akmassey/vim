" ask to avoid unwanted spaces
command! CheckBreaks %s/^\([^%]\+\)\n/\1%\r/gc
