Collectible = Class{__includes = GameObject}
function Collectible:init(def)
    self.x = def.x
    self.y = def.y
    self.dx = 0
    self.dy = POWERUP_OBJECT_SPEED
    self.width = def.width
    self.height = def.height
    self.onConsume = def.onConsume or function () end
    self.texture = def.texture
    self.image = def.image
    self.type = def.type 
    self.r = def.r or nil
    self.g = def.g or nil
    self.b = def.b or nil
end
function Collectible:render()
    love.graphics.setColor(self.r, self.g, self.b, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end