require 'src/Dependencies'
require 'src/constants'

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Craft Your Own Magic')

    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })

    love.mouse.setGrabbed(true)

    gTextures = {
        ['power'] = love.graphics.newImage('graphics/power.png'),
        ['demon'] = love.graphics.newImage('graphics/demon.png'),
        ['water'] = love.graphics.newImage('graphics/water.png'),
        ['waterElement'] = love.graphics.newImage('graphics/waterElement.png')
    }

    gStateMachine = StateMachine{
        ['play'] = function() return PlayState() end
    }
    gStateMachine:change('play')

    keyboard = {}
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    keyboard[key] = true
end

function keyWasPressed(key)
    if keyboard[key] then
        return true
    else
        return false
    end
end

function love.update(dt)
    --love.mouse.setX(math.max(0, math.min(love.mouse.getX(), WINDOW_WIDTH)))
    --love.mouse.setY(math.max(0, math.min(love.mouse.getY(), WINDOW_HEIGHT)))

    gStateMachine:update(dt)
end

function love.draw()
    push:start()

    gStateMachine:render()

    push:finish()
end