CraftSelectState = Class{__includes = BaseState}
function CraftSelectState:init()
    self.craftSelected = 1
    self.crafts = gImages['craft']
    self.leftPress = false
    self.rightPress = false
    self.drawCircleLeft = false
    self.drawCircleRight = false
    self.drawCircleCenter = false
end
function CraftSelectState:update(dt)
    -- left and right to change the craft
    if love.keyboard.wasPressed('left') then
        self.leftPress = true
        self.rightPress = false
        
        if self.craftSelected == 1 then
            gAudio['no-menu-move']:stop()
            gAudio['no-menu-move']:play()
        else
            self.craftSelected = self.craftSelected - 1
            gAudio['menu-move']:stop()
            gAudio['menu-move']:play()
        end
        -- for visual feedback
        self.drawCircleLeft = true
        Timer.after(0.1, function() self.drawCircleLeft = false end)
        
    elseif love.keyboard.wasPressed('right') then
        self.rightPress = true
        self.leftPress = false
        self.craftSelected = math.min(#self.crafts, self.craftSelected + 1)
        if self.craftSelected == #self.crafts then
            gAudio['no-menu-move']:stop()
            gAudio['no-menu-move']:play()
        else
            gAudio['menu-move']:stop()
            gAudio['menu-move']:play()
            self.craftSelected = self.craftSelected + 1
        end
        -- for visual feedback
        self.drawCircleRight = true
        Timer.after(0.1, function() self.drawCircleRight = false end)
    -- enter to select the craft
    elseif love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        gAudio['select']:play()
        Timer.after(0.1, function () gStateMachine:change('start', {playerCraft = self.craftSelected}) end)
        self.drawCircleCenter = true
    end
end
function CraftSelectState:render()
    love.graphics.setFont(gFonts['large_medium_font'])
    --love.graphics.printf()
    love.graphics.printf("Pick A Plane!", 0, VIRTUAL_HEIGHT / 5 - 50, VIRTUAL_WIDTH,'center')
    love.graphics.setFont(gFonts['small_font'])
    love.graphics.printf("Press Enter to Select", 0, VIRTUAL_HEIGHT / 5 + 75, VIRTUAL_WIDTH, 'center')
    
    love.graphics.draw(gTextures['crafts'], gImages['craft'][self.craftSelected], VIRTUAL_WIDTH / 2 - 0.5 * 96, 2 * VIRTUAL_HEIGHT / 3)
    if self.leftPress then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.polygon('fill', VIRTUAL_WIDTH / 2 - 100 - 180, 3.6 * VIRTUAL_HEIGHT / 5 , VIRTUAL_WIDTH / 2 - 50 - 180, 3.6 * VIRTUAL_HEIGHT / 5 - 20, VIRTUAL_WIDTH / 2 - 50 - 180, 3.6 * VIRTUAL_HEIGHT / 5 + 20)
        love.graphics.setColor(1, 1, 1, 0.2)
        if self.drawCircleLeft then
            love.graphics.circle('fill', VIRTUAL_WIDTH / 2 - 100 - 180 + 30, 3.6 * VIRTUAL_HEIGHT / 5, 35)
        end
            
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.polygon('fill', VIRTUAL_WIDTH / 2 - 100 - 180, 3.6 * VIRTUAL_HEIGHT / 5 , VIRTUAL_WIDTH / 2 - 50 - 180, 3.6 * VIRTUAL_HEIGHT / 5 - 20, VIRTUAL_WIDTH / 2 - 50 - 180, 3.6 * VIRTUAL_HEIGHT / 5 + 20)
    end
    
    if self.rightPress then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.polygon('fill', VIRTUAL_WIDTH / 2 + 100 + 180, 3.6 * VIRTUAL_HEIGHT / 5 , VIRTUAL_WIDTH / 2 + 50 + 180, 3.6 * VIRTUAL_HEIGHT / 5 - 20, VIRTUAL_WIDTH / 2 + 50 + 180, 3.6 * VIRTUAL_HEIGHT / 5 + 20)
        love.graphics.setColor(1, 1, 1, 0.2)
        if self.drawCircleRight then
            love.graphics.circle('fill', VIRTUAL_WIDTH / 2 + 100 + 180 - 30, 3.6 * VIRTUAL_HEIGHT / 5, 35)
        end
            
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.polygon('fill', VIRTUAL_WIDTH / 2 + 100 + 180, 3.6 * VIRTUAL_HEIGHT / 5 , VIRTUAL_WIDTH / 2 + 50 + 180, 3.6 * VIRTUAL_HEIGHT / 5 - 20, VIRTUAL_WIDTH / 2 + 50 + 180, 3.6 * VIRTUAL_HEIGHT / 5 + 20)
    end
    if self.drawCircleCenter then
        love.graphics.setColor(1, 1, 1, 0.2)
        love.graphics.circle('fill', VIRTUAL_WIDTH / 2, 2 * VIRTUAL_HEIGHT / 3 + 32, 90)
        love.graphics.setColor(1, 1, 1, 1)
    end
    
    
end
