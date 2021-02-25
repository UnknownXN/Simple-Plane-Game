World = Class{}

function World:init(player)
    self.player = player
    -- table of bullets to be inserted into and later looped over
    self.bullets = {}

    -- same thing but for the asteroids
    self.asteroids = {}
end

function World:update(dt)
    -- change to spawn asteroids
    if math.random(1, 50) == 1 then
        table.insert(self.asteroids, 
            Asteroid({x = math.random(50, VIRTUAL_WIDTH - 50), y = 0, width = math.random(40, 80), height = math.random(40, 80)}))
    end

    -- updates asteroids
    for a, asteroid in pairs(self.asteroids) do
        asteroid:update(dt)
        if asteroid:collides(self.player) then
            gStateMachine:change('start')
        end
    end

    for a, asteroid in pairs(self.asteroids) do
        for b, bullet in pairs(self.bullets) do
            if bullet:collides(asteroid) then
                table.remove(self.asteroids, a)
                table.remove(self.bullets, b)
            end
        end
    end
    -- updates the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:update(dt)
    end
    


    -- garbage collection for bullets, asteroids, etc
    for i, bullet in pairs(self.bullets) do
        if bullet.y < -bullet.height then
            -- self.bullets[i] = nil
            --heard that this might cause wierd behaviour, but it hasn't yet, so I'll leave it for now
            table.remove(self.bullets, i)
        end
    end
    for a, asteroid in pairs(self.asteroids) do
        if asteroid.y < -asteroid.height then
            -- same comment as above
            table.remove(self.asteroids, a)
        end
    end
end

function World:render()
    
    -- renders the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:render()
    end

    -- renders asteroids
    for a, asteroids in pairs(self.asteroids) do
        asteroids:render()
    end
end