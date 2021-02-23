PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.bullets = {}


    self.world = World()
    
    self.player = Player(self.world)

    -- PlayerStates = StateMachine{
    --     ['fly'] = function () return PlayerFlyState() end,
    --     ['reload'] = function () return PlayerReloadState() end
    -- }


    -- table of bullets, could be added to world instead, But since it comes from the player,
    -- adding it to this player class also make sense... i guess
    

end

function PlayState:update(dt)
    self.player:update(dt)
    self.world:update(dt)

end

function PlayState:render()
    self.player:render()
    self.world:render()
end