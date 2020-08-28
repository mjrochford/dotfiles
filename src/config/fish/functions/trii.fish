function trii
        sed 's/\s\+//g' .gitignore | tr '\n' '|' | xargs tree -I
end

