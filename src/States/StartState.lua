StartState = Class{__includes = BaseState}

function StartState:init()

end

function StartState:update(dt)
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
       -- change to PlayState 
       gStateMachine:change('play')
    end
end
function StartState:render()
    love.graphics.setFont(gFonts['large_font'])
    love.graphics.printf("Space Wars", 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small_font'])
    love.graphics.printf("press enter to start" , 0 , VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

    -- change to reference to player width later
    love.graphics.draw(gTextures['space-craft'], gImages['player'], VIRTUAL_WIDTH / 2 - 42, VIRTUAL_HEIGHT * 5/ 6)
end
