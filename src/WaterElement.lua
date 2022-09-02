WaterElement = Class{}

function WaterElement:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16

    self.dx = 0
    self.dy = 0
end

function WaterElement:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function WaterElement:render()
    love.graphics.draw(gTextures['waterElement'], self.x, self.y)
end