PlayerReloadState = Class{__includes = BasePlayerState}
function PlayerReloadState:init(player, world)
    self.player = player
    self.world = world
    
    self.stateTimer = 0

    self.player.currentState = 'reload'
end
function PlayerReloadState:update(dt)
    -- timer to keep track of time and see if it's been 2 seconds
    self.stateTimer = self.stateTimer + dt
    BaseUpdateMovement(dt, self.player)
    if self.stateTimer > 2 then
        self.stateTimer = 0
        PlayerStates:change('fly') 
        self.player.ammo = self.player.maxAmmo
    end

    if self.world.currentlyBossBattle == false then
        self.player.distanceTravelled = self.player.distanceTravelled +  PLAYER_SPEED * self.player.speedMulti * dt
    end
        
end
function PlayerReloadState:render()
    self.player:render()
end