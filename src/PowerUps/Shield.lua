Shield = Class{__includes = GameObject}
function Shield:init(def)
    GameObject:init(def)
    self.texture = gTextures['space-craft']
    self.image = gImages['lives']
end
function Shield:update(dt, player)
    self.x = player.x + player.width * 0.5
    self.y = player.y + player.height * 0.5
end
function Shield:render(player)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.circle('line', player.x + math.floor(0.5 * player.width), player.y + math.floor(0.5 * player.height), 64, 100)
end