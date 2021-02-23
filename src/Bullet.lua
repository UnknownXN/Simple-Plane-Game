Bullet = Class{}

function Bullet:init(Player)
    self.width = 2
    self.height = 10
    self.x = Player.x + Player.width * 0.5 + 1
    self.y = Player.y - self.height
end
function Bullet:update(dt)
    self.x = self.x
    self.y = self.y - BULLET_SPEED * dt
end
function Bullet:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
function Bullet:collides(target)
    if target.x + target.width < self.x or target.x > self.x + self.width then 
        return false
    elseif target.y + target.width < self.y or target.y > self.y + self.height then
        return false
    else
        return true
    end
end