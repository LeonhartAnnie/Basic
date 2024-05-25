local movement = require("movement")
local remove = require("remove")
local composer = require("composer")
local collision = {}
local direction_M = 1
score = 0

function collision.onCollision_M(event,monster)
    if event.phase == "began" and (event.other.id == "wall" or event.other.id == "monster") then
        event.contact.bounce = 1.01
        math.randomseed(os.time())
        direction_M = direction_M * (-1)
        monster.speed_M = math.random(5,20)
        monster.speed_M = monster.speed_M*direction_M
    elseif event.other.id == "fire" then
        remove.rmMonster(monster)
        score = score + 1
    end
end

function collision.onCollision_P(event, player)
    if event.other.id == "ground" then
        onGround = true
        --print(onGround)
    elseif event.other.id == "monster" and event.phase == "ended" then
        player.health = player.health-1
        if player.health == 0 then
            score = 0
            Runtime:removeEventListener("enterFrame", player.P_move_left)
            Runtime:removeEventListener("enterFrame", player.P_move_right)
            player:removeSelf()
            composer.gotoScene("scenes.endScene")
        end
    end
end

function collision.onCollision_Fire(event, fire)
    if event.phase == "began" then
        if event.other.id == "ground" or event.other.id == "wall" or event.other.id == "sky" or event.other.id == "monster" then
            if fire == nil then
                return 0
            end
            remove.rmFire(fire)
        end
    end
end
return collision