Asteroid = Class{}

function Asteroid:init(def)
 
    self.dy = ASTEROID_SPEED
    self.dx  = 0
    self.width = def.width
    self.height = def.height 
    self.texture = def.texture
    self.pointValue = def.pointValue
    self.x = def.x
    self.y = -def.height
    self.hp = 2
end
function Asteroid:update(dt)
    self.x = self.x + 0
    self.y = self.y + self.dy * dt
end

function Asteroid:collides(target)
    if target.x + target.width < self.x or target.x > self.x + self.width then 
        return false
    elseif target.y + target.width < self.y or target.y > self.y + self.height then
        return false
    else
        return true
    end
end
function Asteroid:render()
    -- add a texture later 
    -- love.graphics.draw(, gImages[self.texture], self.x, self.y)

    -- just draws a simple rectange as the asteroid
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end