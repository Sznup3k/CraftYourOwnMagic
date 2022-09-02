Power = Class{}

function Power:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16
end

function Power:render()
    love.graphics.draw(gTextures['power'], self.x, self.y)
end