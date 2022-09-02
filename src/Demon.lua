Demon = Class{}

function Demon:init(x, y)
    self.x = x
    self.y = y

    self.width = 16
    self.height = 16
end

function Demon:render()
    love.graphics.draw(gTextures['demon'], self.x, self.y)
end