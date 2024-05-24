local jumpHeight_P = -15
local jumpHeight_M = -20
local speed_fire = 20
local movement = {}

function movement.move_fire(event, fire, player)
    if fire then
        local X = event.x-player.x
        local Y = event.y-player.y
        local R =(X^2+Y^2)^(0.5)
        local deltaX = X/R
        local deltaY = Y/R
        fire.x = fire.x+speed_fire*deltaX
        fire.y = fire.y+speed_fire*deltaY
        Fire.x,Fire.y = fire.x,fire.y
    end
end

function movement.P_move_left(player)
    if Move_Left == true then
        player.x = player.x-5
        player.rotation =0
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
    end
end

function movement.P_move_right(player)
    if Move_Right == true then
        player.x=player.x+5
        player.rotation =0
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
    end
end

function movement.jump_P(player, event)
    if event.phase == "began" and onGround then
        onGround=false
        player:applyLinearImpulse(0, jumpHeight_P, player.x, player.y)
    end
end

function movement.Jump_M(monster)
    monster:applyLinearImpulse(monster.speed_M, jumpHeight_M, monster.x, monster.y)
end

function movement.fixRotation_M(monster)
    monster.rotation=0
end

function movement.fly(monster, player)
    local speed_FM = 10
    local X = monster.x-player.x
    local Y = monster.y-player.y
    local R =(X^2+Y^2)^(0.5)
    local deltaX = X/R
    local deltaY = Y/R
    monster.x = monster.x + speed_FM*deltaX
    monster.y = monster.y + speed_FM*deltaY
end

function movement.jump()
    
end

return movement