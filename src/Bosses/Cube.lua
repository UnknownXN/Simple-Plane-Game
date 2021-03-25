Cube = Class{}
function Cube:init()
    self.width = 100
    self.height = 100
    self.y = 0
    self.x = VIRTUAL_WIDTH / 2 - 0.5 * self.width
    self.hp = 10
    self.distanceSpawn = 5000
end
function Cube:update(dt)

end
function Cube:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end