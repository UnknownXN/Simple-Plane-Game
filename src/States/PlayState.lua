PlayState = Class{__includes = BaseState}

function PlayState:init()   
    -- initializes instance of palyer and the world
    self.player =  Player()
    self.world = World(self.player)
    
    -- statemachine for the player
    PlayerStates = StateMachine{
        ['fly'] = function () return PlayerFlyState(self.player, self.world) end,
        ['reload'] = function () return PlayerReloadState(self.player, self.world) end
    }
    -- sets to a state
    PlayerStates:change('fly')
    
end
function PlayState:enter(enterParams)
        -- initializes instance of palyer and the world
        self.player =  enterParams.player
        self.world = World(self.player)
        
        -- statemachine for the player
        PlayerStates = StateMachine{
            ['fly'] = function () return PlayerFlyState(self.player, self.world) end,
            ['reload'] = function () return PlayerReloadState(self.player, self.world) end
        }
        -- sets to a state
        PlayerStates:change('fly')
end
function PlayState:update(dt)
    self.player:update(dt)

    PlayerStates:update(dt)
    self.world:update(dt)
    if love.keyboard.wasPressed('l') then
        gStateMachine:change('shop', {player = self.player, world = self.world})
    end

end

function PlayState:render()
    -- self.player:render()
    PlayerStates:render()


    -- renders everything in world (asteroids, bullets, etc)
    self.world:render()
end