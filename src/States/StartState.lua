StartState = Class{__includes = BaseState}

function StartState:init()
    -- to index and call later
    self.options = {
        [1] = function () gStateMachine:change('play', {playerCraft = 1}) end,
        [2] = function () gStateMachine:change('select-craft') end,
        [3] = function () love.event.quit() end
    }
    self.selected = 1
    -- text for each of the options
    self.selection = {
        'Start', 'Select Craft', 'Quit'
    }
end
function StartState:enter(enterParams)
    -- if you enter craftselectstate, this will get called
    self.options[1] = function () gStateMachine:change('play',  {playerCraft = enterParams.playerCraft}) end
end
function StartState:update(dt)

    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
       -- index into self.options and call the function
       gAudio['select']:play()
       self.options[self.selected]()
    end

    -- the selection logic
    if love.keyboard.wasPressed('up') then
        if self.selected == 1 then
            self.selected = #self.options
        else
            self.selected = self.selected - 1
        end
        gAudio['menu-move']:stop()
        gAudio['menu-move']:play()
    elseif love.keyboard.wasPressed('down') then
        if self.selected == #self.options then
            self.selected = 1
        else
            self.selected = self.selected + 1
        end
        gAudio['menu-move']:stop()
        gAudio['menu-move']:play()
    end

    -- selection debugging
    -- if love.keyboard.wasPressed('p') then
    --     print(self.selected)
    -- end
end
function StartState:render()
    love.graphics.setFont(gFonts['large_font'])
    love.graphics.printf("Space Wars", 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small_font'])
    love.graphics.printf("press enter to select" , 0 , VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')

    -- goes over the self.selection table and prints out it's value, and then the next value, and so.
    -- also prints out the values in increments of 64
    local counter = 1
    for i, v in ipairs(self.selection) do
        if i == self.selected then
            love.graphics.setColor(0, 0, 1, 1)
        end
        love.graphics.printf(v, 0, VIRTUAL_HEIGHT / 2 + 72 + counter * 64, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)
        counter = counter + 1
    end



    -- reset to normal color
    love.graphics.setColor(1, 1, 1, 1)
    -- change to reference to player width later
    --love.graphics.draw(gTextures['space-craft'], gImages['player'], VIRTUAL_WIDTH / 2 - 42, VIRTUAL_HEIGHT * 5/ 6)
end
