BasePlayerState = Class{__includes = BaseState}

function BasePlayerState:init()
    
end
function BasePlayerState:update(dt)
    
end
function BasePlayerState:render()
    
end
function BaseUpdateMovement(dt, player)
    -- player updates
    -- movement
    if love.keyboard.isDown('up') then
        player.dy = -PLAYER_SPEED * player.speedMulti
    elseif love.keyboard.isDown('down') then
        player.dy = PLAYER_SPEED * player.speedMulti
    else
        player.dy = 0
    end

    if love.keyboard.isDown('left') then
        player.dx = -PLAYER_SPEED * player.speedMulti
    elseif love.keyboard.isDown('right') then
        player.dx = PLAYER_SPEED * player.speedMulti
    else
        player.dx = 0
    end

    player.y = player.y + player.dy * dt
    player.x = player.x + player.dx * dt
   
    -- clamps player movement within setupScreen
    -- can add lose condition here later
    if player.x < 0 then
        player.x = 0
    elseif player.x > VIRTUAL_WIDTH - 85 then
        player.x = VIRTUAL_WIDTH - 85
    end
    if player.y < 0 then
        player.y = 0
    elseif player.y + 61 > VIRTUAL_HEIGHT then
        player.y = VIRTUAL_HEIGHT - 61
    end

    player.distanceTravelled = player.distanceTravelled + 0.1 * PLAYER_SPEED * player.speedMulti * dt
end