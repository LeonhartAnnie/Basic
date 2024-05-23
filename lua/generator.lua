local physics = require( "physics" )
local generator = {}

function generator.addMonster()
    local shape_1 = { -4.99999380111694,-24.7999973297119, -29.7999935150146,0.800002694129944, -29.3999938964844,14.4000024795532, -18.9999942779541,23.2000026702881, 17.8000068664551,24.8000030517578, 29.8000068664551,14.0000028610229, 29.4000072479248,-5.59999752044678, 8.60000610351563,-24.7999973297119 }
    shape_1.density = 1; shape_1.friction = 0.3; shape_1.bounce = 0.2; 
    local ranNum = math.random(1, 4)
    local path = string.format("images/sprite_%d.png", ranNum)
    local monster = display.newImageRect(path,60, 50 )
    monster.x = -90
    monster.y = 100
    monster.id = "monster"
    monster.isFixed.rotation = true
    if(ranNum == 2 or ranNum == 3) then
        monster.type = "fly"
    else
        monster.type = "jump"
    end
    physics.addBody( monster, {density=shape_1.density, friction=shape_1.friction, bounce=shape_1.bounce, shape=shape_1})
    return monster
end

function generator.addPlayer()
    local player = display.newImageRect( "images/sprite_0.png", 40, 50 )
    player.x = 168
    player.y = 147
    player.rotation = 0
    player.id = "player"
    player.isFixed.rotation = true
    physics.addBody( player, {density=1, friction=0.3, bounce=0.2} )
    return player
end


function generator.addwallUp()
    local wall_Up = display.newImageRect( "images/ground.png", 710, 70 )
    wall_Up.x = 240
    wall_Up.y = -35
    wall_Up.rotation = -180
    wall_Up.id = "sky"
    physics.addBody( wall_Up, "static", { density=1, friction=0.3, bounce=0.2 } )
end

function generator.addwallDown()
    local wall_Down = display.newImageRect( "images/ground.png", 710, 70 )
    wall_Down.x = 240
    wall_Down.y = 355 --355
    wall_Down.id = "ground"
    physics.addBody( wall_Down, "static", { density=1, friction=0.3, bounce=0.2 } )
    return wall_Down
end

function generator.addwall_Left()
    local wall_Left = display.newImageRect( "images/ground.png", 480, 70 )
    wall_Left.x = -150
    wall_Left.y = 145
    wall_Left.rotation = 90
    wall_Left.id = "wall"
    physics.addBody( wall_Left, "static", { density=1, friction=0.3, bounce=0.2 } )
    return wall_Left
end

function generator.addwall_Right()
    local wall_Right = display.newImageRect( "images/ground.png", 480, 70 )
    wall_Right.x = 630
    wall_Right.y = 145
    wall_Right.rotation = -90
    wall_Right.id = "wall"
    physics.addBody( wall_Right, "static", { density=1, friction=0.3, bounce=0.2 } )
end

return generator