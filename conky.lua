require 'cairo'

function conky_lpad(n, s)
    format = '%' .. n .. 's'
    return string.format(format , conky_parse(s))
end

function conky_rpad(n, s)
    format = '%-' .. n .. 's'
    return string.format(format , conky_parse(s))
end