PlayerShopState = Class{__includes = BasePlayerState}
function PlayerShopState:init(player, world)
    self.player = player
    self.world = world
    self.player.currentState = 'shop'
end
function PlayerShopState:update(dt)
    BaseUpdateMovement(dt, self.player)
end
function PlayerShopState:render()
    self.player:render()
end