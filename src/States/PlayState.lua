PlayState = Class{__includes = BaseState}

function PlayState:init()
    
    playery = VIRTUAL_WIDTH / 2 - 42
    playerx = VIRTUAL_HEIGHT * 5/ 6
    playerdy = 0
    playerdx = 0

end

function PlayState:update(dt)
    
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
end

function PlayState:render()
    love.graphics.draw(gTextures['space-craft'], gImages['player'], playerx, playery)
end