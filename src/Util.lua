function CollidesWithMouse(object, mouse)
    if mouse.x >= object.x and mouse.x <= object.x + object.width then
        if mouse.y >= object.y and mouse.y <= object.y + object.height then
            return true
        end
    end

    return false
end

function Collide(a, b)
    if a.x + a.width >= b.x and a.x <= b.x + b.width then
        if a.y + a.height >= b.y and a.y <= b.y + b.height then
            return true
        end
    end

    return false
end