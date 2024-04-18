Cube = Class{}
function Cube:init(player)
    self.width = 100
    self.height = 100
    self.startingY = 50

    self.y = -self.width
    Timer.tween(1, {[self] = {y = self.startingY}})
    self.y = self.startingY
    self.x = VIRTUAL_WIDTH / 2 - 0.5 * self.width
    self.dy = 0
    self.dx = 0

    self.attackdy = 0
    self.attackdx = 0

    self.hp = 25
    self.distanceSpawn = 5000
    self.cubeTimers = {
        ['x'] = 0,
        ['attack'] = 0
    }
    self.player = player
    self.stateMachine = {
        ['prepare-attack'] = function () return Cube:prepareAttack(self) end,
        ['attack'] = function () return Cube:attack(self) end,
        ['move'] = function () return Cube:move(self) end
    }
    self.currentState = 'move'
    self.hasLooped = false

    self.onDefeat = function (player)
        player.money = player.money + 5
        player.points = player.points + 5000
    end
end
function Cube:update(dt)
    self.stateMachine[self.currentState]()
    -- clamps movement on x axis
    if self.x < 0 then
        self.x = 2
    elseif self.x + self.width > VIRTUAL_WIDTH then
        self.x = VIRTUAL_WIDTH - self.width - 2
    end
    -- updates all timers
    for t, timer in pairs(self.cubeTimers) do
        self.cubeTimers[t] = self.cubeTimers[t] + dt 
    end
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.cubeTimers['attack'] > 3 then
        self.cubeTimers['attack'] = 0
        self.currentState = 'prepare-attack'
    end
    
end
function Cube:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
function Cube:move(self)
 
    if self.cubeTimers['x'] > math.random(1, 3) then
        if math.random(1, 2) == 1 then
            self.dx = 0
        else
            if math.random(1, 2) == 1 then
                self.dx = math.random(300, 500)
            else
                self.dx = math.random(-500, -300)
            end
        end
        self.cubeTimers['x'] = 0
    end
    
       
   
end
function Cube:attack(self)
    
    if self.y > VIRTUAL_HEIGHT then
        self.y = self.startingY - 100
        self.hasLooped = true    
    end
    if self.hasLooped and self.y >= self.startingY then
        self.dy = 0
        self.currentState = 'move'
        self.hasLooped = false
    end 

end
function Cube:prepareAttack(self)
    -- finds in what direction the cube needs to go, and then gaves the ratio between the x and y
    self.attackdy = self.player.y - self.y
    self.attackdx = self.player.x - self.x
    local temp = self.attackdx / self.attackdy
    local offset
    -- offset so you cant just hold left or right to dodge
    if self.player.direction == 'right' then
        offset = 200 + self.player.width
        self.attackdx = self.player.dx + offsetX
    elseif self.player.direction == 'left' then
        offset = -200
        self.attackdx = -self.player.x + offsetX
    else
        offset = 0
        self.attackdx = -self.x + self.player.x + 0.5 *self.player.width + offsetX
    end
    -- go telegraph to player
    self.dy = -40
    self.dx = -self.attackdx
    if self.y < self.startingY - 40 then
        -- sets a velocity to the boss
        self.dy = (800)
        -- multiplies it by the ratio between x and y so
        self.dx = (800 * temp + offset)
        self.currentState = 'attack'
        
    end
    
end

function Cube:collides(target)
    if target.x + target.width < self.x or target.x > self.x + self.width then 
        return false
    elseif target.y + target.width < self.y or target.y > self.y + self.height then
        return false
    else
        return true
    end
end