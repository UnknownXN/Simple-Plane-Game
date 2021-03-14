GameObject = Class{}
function GameObject:init(def)
    self.x = def.x
    self.y = def.y
    self.dx = def.dx
    self.dy = def.dy
    self.shape = def.shape or 'rectangle'
    -- can draw line if you want
    self.drawType = def.drawType or 'fill'
    self.width = def.width or nil
    self.height = def.height or nil
    self.radius = def.radius or nil
    

    self.onConsume = def.onConsume or function () end
    self.texture = def.texture
    self.image = def.image
    self.type = def.type
    self.r = def.r or 1
    self.g = def.g or 1
    self.b = def.b or 1
    -- if alpha is an argument set it to that, else 1
    self.alpha = def.alpha or 1


end
function GameObject:update(dt)
    self.y = self.y + self.dy * dt
    self.x = self.x + self.dx * dt
end
function GameObject:collides(target)
    if self.shape == 'rectangle' then
        if target.x + target.width < self.x or target.x > self.x + self.width then 
            return false
        elseif target.y + target.width < self.y or target.y > self.y + self.height then
            return false
        else
            return true
        end
    else
        if self.x - self.radius > target.x + target.width or self.x - self.radius + self.radius * 2 < target.x then
            return false
        elseif self.y - self.radius > target.y + target.height or self.y + self.radius < target.y then
            return false
        else
            return true
        end
    end
end
function GameObject:render()
    -- love.graphics.draw(gTextures[self.texture], gImages[self.image], self.x, self.y)
    if self.texture == nil then
        love.graphics.setColor(self.r, self.g, self.b, self.alpha)
        if self.shape == 'rectangle' then
            love.graphics.rectangle(self.drawType, self.x, self.y, self.width, self.height)
        else
            love.graphics.circle(self.drawType, self.x, self.y, self.radius, 100)
        end
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.draw(self.texture, self.image, self.x, self.y)
    end
  
end
