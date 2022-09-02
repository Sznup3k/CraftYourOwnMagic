Player  = Class{}

function Player:init(x, y)
    self.x = x
    self.y = y

    self.width = 5
    self.height = 5

    self.dx = 0
    self.dy = 0
end

function Player:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if love.keyboard.isDown('w') then
        self.dy = -PLAYER_SPEED
    elseif love.keyboard.isDown('s') then
        self.dy = PLAYER_SPEED
    else
        self.dy = 0
    end

    if love.keyboard.isDown('a') then
        self.dx = -PLAYER_SPEED
    elseif love.keyboard.isDown('d') then
        self.dx = PLAYER_SPEED
    else
        self.dx = 0
    end
end

function Player:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end