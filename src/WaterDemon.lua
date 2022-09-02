WaterDemon = Class{}

function WaterDemon:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16
end

function WaterDemon:render()
    love.graphics.draw(gTextures['WaterDemon'], self.x, self.y)
end