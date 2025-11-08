def find_closest(x, y, z)
    dx = (z - x).abs
    dy = (z - y).abs
 
    if dx == dy
        0
    elsif dx < dy
        1
    else
        2
    end
end
