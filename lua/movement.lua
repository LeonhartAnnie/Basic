local jumpHeight_P = -15
local movement = {}


function movement.P_move_left(player)
    if Move_Left == true then
        player.x = player.x-5
        player.rotation =0
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        print(Move_Left)
    end
end

function movement.P_move_right(player)
    if Move_Right == true then
        player.x=player.x+5
        player.rotation =0
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        print(Move_Right)
    end
end

function movement.jump_P(player, event)
    if event.phase == "began" and onGround then
        onGround=false
        player:applyLinearImpulse(0, jumpHeight_P, player.x, player.y)
    end
end
function movement.fixRotation_M(monster)
    monster.rotation=0
end
function movement.fly()
    
end

function movement.jump()
    
end

return movement