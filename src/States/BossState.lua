BossState = Class{__includes = BaseState}
function BossState:init()
    self.bosses = {
        ['Cube'] = Cube()
    }
    self.currentBoss = self.bosses['Cube']
    
end
function BossState:enter(enterParams)
    self.player = enterParams.player
    self.world = enterParams.world
    -- statemachine for the player
    PlayerStates = StateMachine{
        ['fly'] = function () return PlayerFlyState(self.player, self.world) end,
        ['reload'] = function () return PlayerReloadState(self.player, self.world) end,
        ['shop'] = function () return PlayerShopState(self.player, self.world) end
    }
    -- sets to a state
    PlayerStates:change('fly')
    
    self.world.boss = self.currentBoss
end
function BossState:update(dt)
    self.world:update(dt)
    self.player:update(dt)
    PlayerStates:update(dt)
    self.currentBoss:update(dt)

    if self.currentBoss.hp <= 0 then
        self.world.currentlyBossBattle = false
        gStateMachine:change('play', {player = self.player, world = self.world})

    end
end
function BossState:render()
    self.world:render()
    self.player:render()
    PlayerStates:render()
    self.currentBoss:render()
end