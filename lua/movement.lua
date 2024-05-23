local movement = {}

function movement.P_move_left(player)
    if Move_Left == true then
        player.x = player.x-5
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        --print(Move_Left)
    end
end

function movement.P_move_right(player)
    if Move_Right == true then
        player.x=player.x+5
        --transition.moveTo( player, { x=player.x-5, y=player.y, time=100 } )
        --print(Move_Left)
    end
end

function movement.fly()
    
end

function movement.jump()
    
end

return movement