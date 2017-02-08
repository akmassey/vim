" ensure all fields have commas
command! CheckCommas %s/}\n\(\s\+\a\)/},\r\1/gc
