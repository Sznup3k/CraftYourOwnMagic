PlayState = Class{__include = BaseState}

function PlayState:init()
    self.objects = {
        ['power'] = {Power(VIRTUAL_WIDTH/3, VIRTUAL_HEIGHT/3)},
        ['water'] = {Water(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)},
        ['demon'] = {Demon(30, 30)}
    }

    self.holding = false
    self.heldF = 'water'
    self.heldO = 1
end

function PlayState:enter()

end

function PlayState:update(dt)
    mouseX, mouseY = push:toGame(love.mouse.getX(), 0), push:toGame(love.mouse.getY(), 0)

    if not self.holding then
        for k, family in pairs(self.objects) do
            for i, object in pairs(family) do
                if CollidesWithMouse(object, {x = mouseX, y = mouseY}) then
                    if love.mouse.isDown(1) then
                        self.holding = true
                        self.heldF = k
                        self.heldO = i
                    end
                end

                for k2, family2 in pairs(self.objects) do
                    for i2, object2 in pairs(family2) do
                        if object ~= object2 then
                            if Collide(object, object2) then
                                if TABLE[k][k2] ~= nil then
                                    sX, sY = (object.x+object2.x)/2, (object.y+object2.y)/2
                                    table.insert(self.objects[TABLE[k][k2][1]], TABLE[k][k2][2])
                                    self.objects[TABLE[k][k2][1]][#self.objects[TABLE[k][k2][1]]].x = sX
                                    self.objects[TABLE[k][k2][1]][#self.objects[TABLE[k][k2][1]]].y = sY

                                    table.remove(self.objects[k], i)
                                    table.remove(self.objects[k2], i2)
                                end
                            end
                        end     
                    end
                end
            end
        end
    end
    if not love.mouse.isDown(1) then self.holding = false end

    if self.holding then
        object = self.objects[self.heldF][self.heldO]
        object.x = mouseX - object.width / 2
        object.y = mouseY - object.height / 2
    end
end

function PlayState:render()
    for k, family in pairs(self.objects) do
        for i, v in pairs(family) do
            v:render()
        end
    end
end