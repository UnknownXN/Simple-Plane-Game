Coins = Class{__includes = GameObject}
function Coins:init(def)
    self.x = def.x
    self.y = def.y
    self.dx = 0
    self.dy = POWERUP_OBJECT_SPEED
    self.radius = 32
    self.diameter = 2 * self.radius
    self.onConsume = def.onConsume or function () end
    self.texture = def.texture
    self.image = def.image
    self.type = def.type 
end
function Coins:collides(target)
    if self.x - self.radius > target.x + target.width or self.x - self.radius + self.diameter < target.x then
        return false
    elseif self.y - self.radius > target.y + target.height or self.y + self.radius < target.y then
        return false
    else
        return true
    end
end
 
function Coins:render()
    love.graphics.setColor(1, 1, 0, 1)
    love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end