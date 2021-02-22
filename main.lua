require 'src/dependencies'
require 'src/constants'
function love.load()
    math.randomseed(os.time())

    player_craft = math.random(1, 5)

    love.window.setTitle('Space Wars')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true
    })

    offsetY = 0
    offsetX = 0

    backgroundWidth, backgroundHeight = background:getDimensions()

    playery = VIRTUAL_HEIGHT - 64
    playerx = VIRTUAL_WIDTH / 2 
    playerdy = 0
    playerdx = 0
    gStateMachine = {
        ['sta
    }
    -- statemachine implementation

    love.keyboard.keypressed = {}
end
function love.update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    -- player updates
    -- movement
    if love.keyboard.isDown('up') then
        playerdy = -PLAYER_SPEED
    elseif love.keyboard.isDown('down') then
        playerdy = PLAYER_SPEED
    else
        playerdy = 0
    end

    if love.keyboard.isDown('left') then
        playerdx = -PLAYER_SPEED
    elseif love.keyboard.isDown('right') then
        playerdx = PLAYER_SPEED
    else
        playerdx = 0
    end

    playery = playery + playerdy * dt
    playerx = playerx + playerdx * dt
   
    -- clamps player movement within setupScreen
    -- can add lose condition here later
    if playerx < 0 then
        playerx = 0
    elseif playerx > 1280 - 85 then
        playerx = 1280 - 85
    end
    if playery < 0 then
        playery = 0
    elseif playery + 61 > 720 then
        playery = 720 - 61
    end

    -- background parallax scrolling
    offsetY = offsetY + SCROLL_SPEED * dt
    offsetY = offsetY % (0.5 * backgroundHeight)

    love.keyboard.keypressed = {}
end
function love.resize(w, h)
    return push:resize(w, h)
  end
function love.keypressed(key)

    love.keyboard.keypressed[key] = true
end
function love.keyboard.wasPressed(key)
    return love.keyboard.keypressed[key]
end
function love.draw()
    push:start()
    
    --draw here
    --love.graphics.translate(offsetX, offsetY)
    love.graphics.draw(background, offsetX, - (0.5 * backgroundHeight) +  offsetY)
    love.graphics.draw(gTextures['space-craft'], gImages['player'], playerx, playery)
    push:finish()
end
