function TypeOf(value)
    if type(value) == "table" and value.type then
        return value.type
    else
        return type(value)
    end
end

function Point(x, y)
    return {
        type = "Point",
        x = x,
        y = y
    }
end
