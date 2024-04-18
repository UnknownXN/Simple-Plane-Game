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
        player.dy = -player.speed * player.speedMulti
    elseif love.keyboard.isDown('down') then
        player.dy = player.speed * player.speedMulti
    else
        player.dy = 0
    end

    if love.keyboard.isDown('left') then
        player.dx = -player.speed * player.speedMulti
        player.direction = 'left'
    elseif love.keyboard.isDown('right') then
        player.dx = player.speed * player.speedMulti
        player.direction = 'right'
    else
        player.dx = 0
        player.direction = 'center'
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
end
function BasePlayerBonuses(dt, player)
    if player.points >= livePoints then
        player.lives = math.min(3, player.lives + 1)
        livePoints = livePoints + 10000
    end
end