Player = Class{}

function Player:init()
    self.x = VIRTUAL_WIDTH / 2 - 42
    self.y = VIRTUAL_HEIGHT * 5 / 6

    self.dx = 0
    self.dy = 0

    self.width = 85
    self.height = 61

    self.ammo = 5

    -- reference to other things in the world

    
end

function Player:update(dt)

    -- -- player updates
    -- -- movement
    -- if love.keyboard.isDown('up') then
    --     self.dy = -PLAYER_SPEED
    -- elseif love.keyboard.isDown('down') then
    --     self.dy = PLAYER_SPEED
    -- else
    --     self.dy = 0
    -- end

    -- if love.keyboard.isDown('left') then
    --     self.dx = -PLAYER_SPEED
    -- elseif love.keyboard.isDown('right') then
    --     self.dx = PLAYER_SPEED
    -- else
    --     self.dx = 0
    -- end

    -- self.y = self.y + self.dy * dt
    -- self.x = self.x + self.dx * dt
   
    -- -- clamps player movement within setupScreen
    -- -- can add lose condition here later
    -- if self.x < 0 then
    --     self.x = 0
    -- elseif self.x > VIRTUAL_WIDTH - 85 then
    --     self.x = VIRTUAL_WIDTH - 85
    -- end
    -- if self.y < 0 then
    --     self.y = 0
    -- elseif self.y + 61 > VIRTUAL_HEIGHT then
    --     self.y = VIRTUAL_HEIGHT - 61
    -- end

    -- if love.keyboard.wasPressed('space') then
    --     print('shoot')
    --     -- inserts into the bullets table in the world and instance of a bullet
    --     table.insert(self.world.bullets, Bullet(self))
    -- end


end

function Player:render()
    love.graphics.draw(gTextures['space-craft'], gImages['player'], self.x, self.y)
end