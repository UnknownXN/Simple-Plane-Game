anim8 = require 'lib/anim8'
push = require 'lib/push'
Class = require 'lib/class'
Timer = require 'lib/knife.timer'

require 'src/Util/GenerateQuads'
require 'src/Util/Animations'

require 'src/StateMachine'

require 'src/States/BaseState'
require 'src/States/PlayState'
require 'src/States/ShopState'
require 'src/States/StartState'
require 'src/States/CraftSelectState'
require 'src/States/EndState'
require 'src/States/BossState'

require 'src/Player'
require 'src/Bullet'
require 'src/World'
require 'src/Asteroid'
require 'src/GameObject'

require 'src/Bosses/Cube'

require 'src/GUI/Panel'
require 'src/GUI/PicturePanel'

require 'src/DATA_DRIVEN_DESIGN'

require 'src/PowerUps/Shield'

require 'src/States/PlayerStates/PlayerFlyState'
require 'src/States/PlayerStates/PlayerReloadState'
require 'src/States/PlayerStates/BasePlayerState'
require 'src/States.PlayerStates/PlayerShopState'

background = love.graphics.newImage('graphics/space.png')

gTextures = {
    ['space-craft'] = love.graphics.newImage('graphics/space-craft.png'),
    ['crafts'] = love.graphics.newImage('graphics/planes.png'),
    ['buyables'] = love.graphics.newImage('graphics/buyables.png'),
    ['power-ups'] = love.graphics.newImage('graphics/power-ups.png'),
    ['power-ups-objects'] = love.graphics.newImage('graphics/power-ups-object.png'),
    ['supeks-coin'] = love.graphics.newImage('graphics/supeks-coin.png')
}

gImages = {
    ['player'] = love.graphics.newQuad(702, 118, 85, 61, gTextures['space-craft']:getDimensions()),
    ['craft'] = GenerateQuads(96, 64, gTextures['crafts']),
    ['lives'] = love.graphics.newQuad(4 + 4 * 33, 4 + math.random(0, 4) * 33, 32, 32, gTextures['space-craft']:getDimensions()),
    ['buyables'] = GenerateQuads(64, 64, gTextures['buyables']),
    ['power-ups'] = GenerateQuads(96, 96, gTextures['power-ups']),
    ['power-up-objects'] = GenerateQuads(32, 32, gTextures['power-ups-objects']),
    ['supeks-coin'] = GenerateQuads(64, 64, gTextures['supeks-coin'])
    --['player'] = love.graphics.newQuad(0, 0, 32, 32, gTextures['space-craft']:getDimensions())
}
gFonts = {
    ['large_font'] = love.graphics.newFont('fonts/font.ttf', 128),
    ['large_medium_font'] = love.graphics.newFont('fonts/font.ttf', 96),
    ['medium_font'] = love.graphics.newFont('fonts/font.ttf', 64),
    ['small_font'] = love.graphics.newFont('fonts/font.ttf', 32)
}
gAudio = {
    ['pickup'] = love.audio.newSource('audio/coin.wav', 'static'),
    ['bullets'] = love.audio.newSource('audio/bullets.wav', 'static'),
    ['damaged'] = love.audio.newSource('audio/damaged.wav', 'static'),
    ['powerup-1'] = love.audio.newSource('audio/powerup-1.wav', 'static'),
    ['powerup-2'] = love.audio.newSource('audio/powerup-2.wav', 'static'),
    ['menu-move'] = love.audio.newSource('audio/menu-move.wav', 'static'),
    ['select'] = love.audio.newSource('audio/select.wav', 'static'),
    ['explosion'] = love.audio.newSource('audio/explosion.wav', 'static'),
    ['no-menu-move'] = love.audio.newSource('audio/no-select.wav', 'static'),
    ['coins'] = love.audio.newSource('audio/pickup.wav', 'static'),
    ['win'] = love.audio.newSource('audio/win.wav', 'static')
}