local jumpHeight_P = -15
local movement = {}
local onGround = false


function movement.P_move_left(player)
    if Move_Left == true then
        player.x = player.x-5
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        print(Move_Left)
    end
end

function movement.P_move_right(player)
    if Move_Right == true then
        player.x=player.x+5
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        print(Move_Right)
    end
end

function movement.jump_P(player, event)
    print("owo")
    if event.phase == "began" and onGround then
        onGround=false
        print(onGround)
        player:applyLinearImpulse(0, jumpHeight_P, player.x, player.y)
    end
end

function movement.fly()
    
end

function movement.jump()
    
end

return movement