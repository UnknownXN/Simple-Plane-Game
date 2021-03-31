ShopState = Class{__includes = BaseState}


-- make 3 rectangles and if they collide, add affect
function ShopState:init(def)
    self.items = {}
    self.text = {}
    self.buyables = {
        [1] = function (__, player)
            -- if the player has enough money, give him the power up. If not, empty text, and then put in a message saying he doesn't have enough money
            if player.money  >= player.ammoPrice and player.AmmoLevel < 3 then 
                player.money = player.money - 8
                player.maxAmmo = player.maxAmmo + 5
                player.AmmoLevel = player.AmmoLevel + 1
                player.AmmoLevel = math.max(3, player.AmmoLevel)
                player.ammo = player.maxAmmo
                player.ammoPrice = player.ammoPrice + 2
                gStateMachine:change('play', {player = self.player, world = self.world})
            else
                self.text = {}
                if player.money < player.ammoPrice then
                    table.insert(self.text, "Insufficient Balance\nPrice is " .. tostring(player.ammoPrice) .. ", but only " .. player.money)    
                elseif player.AmmoLevel == 3 then
                    table.insert(self.text, "Level is maxed " .. tostring(player.AmmoLevel))
                end
                
                --Timer.clear()
                Timer.after(3, function () self.text = {} end)
            end
                 end,
        [2] = function (__, player)
            if player.money >= player.speedPrice and player.speedLevel < 3 then
                player.money = player.money - 9
                player.speedLevel = player.speedLevel + 1
                player.speedMulti = 1 + 0.1 * (player.speedLevel - 1)
                player.speedLevel = math.max(3, player.speedLevel)
                player.speedPrice = player.speedPrice + 3
                gStateMachine:change('play', {player = self.player, world = self.world})
            else
                self.text = {}
                if player.money < player.speedPrice then
                    table.insert(self.text, "Insufficient Balance\nPrice is " .. tostring(player.speedPrice) .. ", but only " .. player.money)
                elseif player.speedLevel == 3 then
                    table.insert(self.text, "Leve is maxed" .. tostring(player.speedLevel))
                end

                --Timer.clear()
                Timer.after(3, function () self.text = {} end)
            end
        end,
        [3] = function (__, player)
            if player.money >= player.bulletDamagePrice and player.bulletDamageLevel < 3 then
                player.money = player.money - 10
                player.bulletDamage = player.bulletDamage + 1
                player.bulletDamageLevel = player.bulletDamageLevel + 1
                player.bulletDamageLevel = math.max(3, player.bulletDamageLevel)
                player.bulletDamagePrice = player.bulletDamagePrice + 4
                gStateMachine:change('play', {player = self.player, world = self.world})
            else
                self.text = {}
                if player.money < player.bulletDamagePrice then
                    table.insert(self.text, "Insufficient Balance\nPrice is " .. tostring(player.bulletDamagePrice) .. ", but only " .. player.money)
                elseif player.bulletDamageLevel == 3 then
                    table.insert(self.text, "Level is maxed" .. tostring(player.bulletDamageLevel))
                end
                --Timer.clear()
                Timer.after(3, function () self.text = {} end)
            end
            
        end
    }

    for i = 0, 2 do
        -- fix this tomorrow
        table.insert(self.items, GameObject{x = PADDING + i * (VIRTUAL_WIDTH - 2 * PADDING - 64) / (3 - 1), y = -64, width = 64, height = 64, onConsume = self.buyables[i + 1],
            texture = gTextures['buyables'], image = gImages['buyables'][i + 1]})
    end
    for i, item in pairs(self.items) do 
        print(item.x)
    end
end
function ShopState:enter(enterParams)
    self.player = enterParams.player
    self.world = enterParams.world
    PlayerStates:change('shop')
    for i, item in pairs(self.items) do
        Timer.tween(0.5, {[item] = {y = VIRTUAL_HEIGHT / 2 - 128}})
        print(item.y)
    end
end
function ShopState:update(dt)
    self.player:update(dt)
    PlayerStates:update(dt)
    
    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then
        -- change to PlayState 
        gStateMachine:change('play', {player = self.player, world = self.world})
    end


    for i, item in ipairs(self.items) do
        if item:collides(self.player) then
            item:onConsume(self.player)

        end
    end
    
end
function ShopState:render()
    self.player:render()
    PlayerStates:render()
    for i, item in pairs(self.items) do 
        love.graphics.setColor(1, 1, 1, 1)
        item:render()
        -- love.graphics.rectangle('fill', item.x, item.y, item.width, item.height)
    end
    self.world:PlayerStatsRender(self.player)
    for t, text in pairs(self.text) do
        love.graphics.printf(text, 0, 0, VIRTUAL_WIDTH, 'center')
    end
end