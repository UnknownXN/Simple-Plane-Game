PlayerReloadState = Class{__includes = BasePlayerState}
function PlayerReloadState:init(player, world)
    self.player = player
    self.world = world
    
    self.stateTimer = 0

    self.player.currentState = 'reload'
end
function PlayerReloadState:update(dt)
    self.stateTimer = self.stateTimer + dt
    BaseUpdateMovement(dt, self.player)
    if self.stateTimer > 2 then
        self.stateTimer = 0
        PlayerStates:change('fly') 
        self.player.ammo = self.player.maxAmmo
        print('change to fly')
    end
    -- issue seems like timer isn't resetting, bc after the first delay, there's no more delay
    -- Timer.after(2, function() 
        
    --     PlayerStates:change('fly') 
    --     self.player.ammo = 5
    --     print('change to fly')
    --     --Timer.clear()
    -- end)
    -- Timer.update(dt)
    self.player.distanceTravelled = self.player.distanceTravelled +  PLAYER_SPEED * self.player.speedMulti * dt
end
function PlayerReloadState:render()
    self.player:render()
end