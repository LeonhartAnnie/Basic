local physics = require( "physics" )
local generator = {}

function generator.addPlayer()
    local player = display.newImageRect( "images/sprite_0.png", 40, 50 )
    player.x = 168
    player.y = 147
    player.rotation = 0
    physics.addBody( player, {density=1, friction=0.3, bounce=0.2} )
    return player
end

function generator.addwallUp()
    local wall_Up = display.newImageRect( "images/ground.png", 480, 70 )
    wall_Up.x = 240
    wall_Up.y = -35
    wall_Up.rotation = -180
    physics.addBody( wall_Up, "static", { density=1, friction=0.3, bounce=0.2 } )
end

function generator.addwallDown()
    local wall_Down = display.newImageRect( "images/ground.png", 710, 70 )
    wall_Down.x = 240
    wall_Down.y = 355 --355
    physics.addBody( wall_Down, "static", { density=1, friction=0.3, bounce=0.2 } )
    return wall_Down
end

function generator.addwall_Left()
    local wall_Left = display.newImageRect( "images/ground.png", 480, 70 )
    wall_Left.x = -150
    wall_Left.y = 145
    wall_Left.rotation = 90
    physics.addBody( wall_Left, "static", { density=1, friction=0.3, bounce=0.2 } )
    return wall_Left
end

function generator.addwall_Right()
    local wall_Right = display.newImageRect( "images/ground.png", 480, 70 )
    wall_Right.x = 630
    wall_Right.y = 145
    wall_Right.rotation = -90
    physics.addBody( wall_Right, "static", { density=1, friction=0.3, bounce=0.2 } )
    return wall_Right
end

return generator