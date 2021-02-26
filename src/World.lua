World = Class{}

function World:init(player)
    self.player = player

    -- table of bullets to be inserted into and later looped over
    self.bullets = {}

    -- same thing but for the asteroids
    self.asteroids = {}

    self.objects = {}
end

function World:update(dt)
    -- chance to spawn power up
    if math.random(1, 60) == 1 then
        table.insert(self.objects,
        GameObject{x = math.random(0, VIRTUAL_WIDTH - 16), y = 0 - 16, width = 16, height = 16, type = 'points',
            onConsume = function () self.player.points = self.player.points + 500 end})
    end
    -- change to spawn asteroids
    if math.random(1, 50) == 1 then
        table.insert(self.asteroids, 
            Asteroid({x = math.random(50, VIRTUAL_WIDTH - 50), y = 0, width = math.random(40, 80), height = math.random(40, 80), pointValue = 100}))
    end

    -- updates asteroids
    for a, asteroid in pairs(self.asteroids) do
        asteroid:update(dt)
        if asteroid:collides(self.player) and not self.player.invulnerable then
            self.player.lives = self.player.lives - 1
            self.player.invulnerable = true
            table.remove(self.asteroids, a)
            Timer.after(2, function() self.player.invulnerable = false end)
            if self.player.lives == 0 then
                gStateMachine:change('end', {distance = self.player.distanceTravelled,
                    points = self.player.points, money = self.player.money})
            end
        end
    end

    -- updates game objects so it looks like they're moving
    for o, object in pairs(self.objects) do
        object:update(dt)
    end

    -- checks if each asteroid has collided with a bullet or not
    for a, asteroid in pairs(self.asteroids) do
        for b, bullet in pairs(self.bullets) do
            -- if so, then remove both objects, add a sound later, and give the player some points
            if bullet:collides(asteroid) then
                table.remove(self.asteroids, a)
                table.remove(self.bullets, b)

                self.player.points = self.player.points + asteroid.pointValue
            end
        end
    end
    -- updates the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:update(dt)
    end

    for p, object in pairs(self.objects) do
        if object:collides(self.player) then
            object.onConsume()
            table.remove(self.objects, p)
        end
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

    Timer.update(dt)
end

function World:render()
    for i = 0, self.player.lives - 1 do 
        love.graphics.draw(gTextures['space-craft'], gImages['lives'], i * 64, 0, 0, 1.5, 1.5)
    end

    -- draws hwo much ammo we have
    love.graphics.setFont(gFonts['small_font'])
    love.graphics.print('Ammo   : ' .. self.player.ammo, 0, 60)
    -- prints amount of points we have
    love.graphics.print('Points  : ' .. self.player.points, 0, 100)
    -- prints how much money we have
    love.graphics.print('Money  : ' .. self.player.money, 0, 140)
    -- prints distanceTravelled
    love.graphics.printf('Distance: ' .. math.floor(self.player.distanceTravelled), 0, 0, VIRTUAL_WIDTH, 'right')
    -- renders the bullets
    for i, bullet in pairs(self.bullets) do
        bullet:render()
    end

    -- renders asteroids
    for a, asteroids in pairs(self.asteroids) do
        asteroids:render()
    end

    for o, object in pairs(self.objects) do
        object:render()
    end
end