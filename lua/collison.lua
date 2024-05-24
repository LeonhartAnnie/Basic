local collision = {}
local speed_M = 7
local direction_M = 1

function collision.onCollision_M(event,monster)
    if event.phase == "ended" and event.other.id == "wall" then
        math.randomseed(os.time())
        direction_M = direction_M * (-1)
        speed_M = math.random(5,20)
        speed_M = speed_M*direction_M
        print(speed_M)
    elseif event.other.id == "fire" then
        remove(monster)
    end
end

function collision.onCollision_P(event, player)
    if event.other.id == "ground" then
        onGround = true
        --print(onGround)
    elseif event.other.id == "monster" then
        player.health = player.health-1
        print(player.health)
    end
end

function collision.onCollision_Fire(event, fire)
    if event.phase == "began" then
        if event.other.id == "ground" or event.other.id == "wall" or event.other.id == "sky" or event.other.id == "monster" then
            if fire == nil then
                return 0
            end
            remove(fire)
        end
    end
end
return collision