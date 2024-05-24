local collision = {}
local speed_M = 7
local direction_M = 1

function collision.onCollision_M(event)
    if event.phase == "began" and (event.other.id == "wall" or event.other.id == "monster") then
        event.contact.bounce = 1.5
        math.randomseed(os.time())
        direction_M = direction_M * (-1)
        speed_M = math.random(5,20)
        speed_M = speed_M*direction_M
        print(speed_M)
    end
end

function collision.onCollision_P(event, player)
    if event.other.id == "ground" then
        onGround = true
        --print(onGround)
    elseif event.other.id == "monster" and event.phase == "ended" then
        player.health = player.health-1
        print(player.health)
    end
end

return collision