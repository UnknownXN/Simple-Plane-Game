BossState = Class{__includes = BaseState}
function BossState:init()

    
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
    self.bosses = {
        ['Cube'] = Cube(self.player)
    }
    self.currentBoss = self.bosses['Cube']
    self.world.boss = self.currentBoss
end
function BossState:update(dt)
    self.world:update(dt)
    self.player:update(dt)
    PlayerStates:update(dt)
    self.currentBoss:update(dt)

    if self.currentBoss.hp <= 0 then
        self.world.currentlyBossBattle = false
        self.currentBoss.onDefeat(self.player)
        gStateMachine:change('play', {player = self.player, world = self.world})
        gAudio['win']:play()

    end
    for p, powerup in pairs(self.world.powerUps) do
        if powerup:collides(self.currentBoss) and self.player.invulnerable == false then
          
            self.player.invulnerable = true
            Timer.after(2, function() self.player.invulnerable = false end)
            
            table.remove(self.world.powerUps, p)
        end
    end
    if self.currentBoss:collides(self.player) and self.player.invulnerable == false then
        -- ideally add a function in which all of this is added
        self.player.lives = self.player.lives - 1
        gAudio['damaged']:play()
        self.player.invulnerable = true
        Timer.after(2, function() self.player.invulnerable = false end)
        if self.player.lives <= 0 then
            gStateMachine:change('end', {distance = self.player.distanceTravelled,
                points = self.player.points, money = self.player.money})
        end
    end

end
function BossState:render()
    self.world:render()
    self.player:render()
    PlayerStates:render()
    self.currentBoss:render()
end
function BossState:processAI()

end