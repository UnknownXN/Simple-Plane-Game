PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.bullets = {}


   
    
    self.player = Player()
    self.world = World(self.player)
    
    self.ammo = 5

    PlayerStates = StateMachine{
        ['fly'] = function () return PlayerFlyState(self.player, self.world) end,
        ['reload'] = function () return PlayerReloadState(self.player, self.world) end
    }

    PlayerStates:change('fly')


    -- table of bullets, could be added to world instead, But since it comes from the player,
    -- adding it to this player class also make sense... i guess
    

end

function PlayState:update(dt)
    --self.player:update(dt)
    PlayerStates:update(dt)
    self.world:update(dt)

end

function PlayState:render()
    -- self.player:render()
    PlayerStates:render()
    self.world:render()
end