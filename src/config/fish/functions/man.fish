function man
    nvim -c 'set ft=man nolist nomod' -c "Man $argv"
end
