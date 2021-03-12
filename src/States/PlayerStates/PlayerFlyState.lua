PlayerFlyState = Class{__includes = BasePlayerState}

function PlayerFlyState:init(player, world)
    self.player = player
    self.world = world
    self.player.currentState = 'fly'
end
function PlayerFlyState:update(dt)
    BaseUpdateMovement(dt, self.player)

    if love.keyboard.wasPressed('space') then
        -- inserts into the bullets table in the world and instance of a bullet
        table.insert(self.world.bullets, Bullet(self.player))

        -- substracts ammo by 1
        self.player.ammo = self.player.ammo - 1
        print(self.player.ammo)
    end

    if self.player.ammo == 0 then
        PlayerStates:change('reload')
        print('reload')
    end

    self.player.distanceTravelled = self.player.distanceTravelled +  PLAYER_SPEED * self.player.speedMulti * dt
    --Timer.update(dt)
end
function PlayerFlyState:render()
    self.player:render()
    --love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width, self.player.height)
end