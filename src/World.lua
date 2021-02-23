World = Class{}

function World:init()
    -- table of bullets to be inserted into and later looped over
    self.bullets = {}
end

function World:update(dt)
    -- updates the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:update(dt)
    end

    for i, bullet in pairs(self.bullets) do
        if bullet.y < -bullet.height then
            -- self.bullets[i] = nil
            --heard that this might cause wierd behaviour, but it hasn't yet, so I'll leave it for now
            table.remove(self.bullets, i)
            print('begone')
        end
    end
end

function World:render()
    
    -- renders the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:render()
    end
end