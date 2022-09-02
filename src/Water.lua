Water = Class{}

function Water:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16

    self.dx = 0
    self.dy = 0
end

--[[function Water:collidesMouse(mouse)
    if mouse.x >= self.x and mouse.x <= self.x + self.width then
        if mouse.y >= self.y and mouse.y <= self.y + self.height then
            return true
        end
    end

    return false
end]]

function Water:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Water:render()
    love.graphics.draw(gTextures['water'], self.x, self.y)
end