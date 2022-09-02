WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 215
VIRTUAL_HEIGHT = 121

PLAYER_SPEED = 50

TABLE = {
    ['power'] = {['water'] = {'waterElement', function() return WaterElement(VIRTUAL_WIDTH+5, VIRTUAL_HEIGHT+5) end}},
    ['demon'] = {['water'] = {'waterDemon', WaterDemon(VIRTUAL_WIDTH+5, VIRTUAL_HEIGHT+5)}},
    ['water'] = {['power'] = {'waterElement', WaterElement(VIRTUAL_WIDTH+5, VIRTUAL_HEIGHT+5)}, ['demon'] = {'waterDemon', WaterDemon(VIRTUAL_WIDTH+5, VIRTUAL_HEIGHT+5)}},
    ['waterElement'] = {},
    ['waterDemon'] = {}
}