EndState = Class{__includes = BaseState}
function EndState:enter(params)
    self.distance = params.distance
    self.points = params.points
    self.money = params.money
end
function EndState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end
end
function EndState:render()
    love.graphics.setFont(gFonts['medium_font'])
    love.graphics.printf('Distance: ' .. math.floor(self.distance), 0, VIRTUAL_HEIGHT / 2 - 120, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Points: ' .. math.floor(self.points), 0, VIRTUAL_HEIGHT / 2 - 50, VIRTUAL_WIDTH, 'center')
    -- love.graphics.printf('Money: ' ..math.floor(self.money), 0, VIRTUAL_HEIGHT / 2 + 20, VIRTUAL_WIDTH, 'center')
    -- uses simple formula to calculate Score
    -- places more weigh on points, bc they are harder to get
    love.graphics.printf('Score: ' ..math.floor((self.distance + 2 * self.points) / 5), 0, VIRTUAL_HEIGHT / 2 + 20, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['small_font'])
    love.graphics.printf('press enter to play again', 0, VIRTUAL_HEIGHT / 2 + 130, VIRTUAL_WIDTH, 'center')
end