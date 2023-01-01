function gsplit (inputstr, sep)
        if sep == nil then 
                sep = "%s" -- any whitespace == \s in regex
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

function fmt(line)
    new_line = string.gsub(line, "?", "")
    split_line = gsplit(new_line, "\t")
    if #split_line == 3 then
        return string.format("\t// %s \r\n\t%s %s", split_line[1], split_line[2], split_line[3])
    end
end
