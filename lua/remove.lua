local remove = {}

function remove.rmFire(fire)
    Runtime:removeEventListener("enterFrame",fire.move_fire)
    fire:removeSelf()
    fire = nil
    return fire
end

function remove.rmMonster(monster)
    timer.cancel(monster.jump_timer)
    timer.cancel(monster.fixRotation_timer)
    monster:removeSelf()
end

function remove.rmPlyer(player)
    Runtime:addEventListener("enterFrame", player.P_move_left)
    Runtime:addEventListener("enterFrame", player.P_move_right)
    player:removeSelf()
end

return remove